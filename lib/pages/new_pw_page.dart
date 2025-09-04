import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/pages/security_question_page.dart';

class NewPwPage extends StatefulWidget {
  const NewPwPage({super.key});

  @override
  State<NewPwPage> createState() => _NewPwPageState();
}

class _NewPwPageState extends State<NewPwPage> {
  String displayText = '';
  final TextEditingController controllerNPw = TextEditingController();
  final TextEditingController controllerCPw = TextEditingController();
  String activeField = "new";

  bool saving = false;

  Future<void> _saveToFirestore() async {
    setState(() {
      saving = true;
    });
    try {
      if (controllerNPw.text.trim().isEmpty ||
          controllerCPw.text.trim().isEmpty) {
        throw Exception('Please enter passwords');
      }
      if (controllerNPw.text != controllerCPw.text) {
        throw Exception('Passwords must be the same');
      }

      await FirebaseFirestore.instance.collection('usersPW').add({
        'newPassword': controllerNPw.text,
        'createAt': FieldValue.serverTimestamp(),
      });
      print('Password saved successfully');
      showDialog2();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved failed: $e'))
      );
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  void onNumberPressed(String number) {
    setState(() {
      if (activeField == "new") {
        controllerNPw.text += number;
      } else {
        controllerCPw.text += number;
      }
    });
  }

  void deleteNumber() {
    setState(() {
      if (activeField == "new" && controllerNPw.text.isNotEmpty) {
        controllerNPw.text =
            controllerNPw.text.substring(0, controllerNPw.text.length - 1);
      } else if (activeField == "confirm" && controllerCPw.text.isNotEmpty) {
        controllerCPw.text =
            controllerCPw.text.substring(0, controllerCPw.text.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/otpBg.png'),
                    fit: BoxFit.fitWidth
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context, MaterialPageRoute(
                                builder: (context) {
                                  return SecurityQuestionPage();
                                },
                              )
                            );
                          }, 
                          icon: Image.asset('assets/images/back.png')
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Create New Password',
                          style: TextStyle(
                            fontSize: 28,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          'It will used for payment and send money',
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(102, 103, 170, 0.3)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color.fromRGBO(102, 103, 170, 1)
                            ),
                            child: Image.asset('assets/images/ex.png'),
                          ),
                          SizedBox(width: 25,),
                          Text(
                            'New password must be different from\nprevious password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(102, 103, 170, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'New Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(96, 96, 96, 1)
                        ),
                      ),
                    ),
                    TextField(
                      controller: controllerNPw,
                      readOnly:
                          true,
                      onTap: () {
                        setState(() {
                          activeField = "new";
                        });
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Confirmed password',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(96, 96, 96, 1)
                        ),
                      ),
                    ),
                   TextField(
                      controller: controllerCPw,
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          activeField = "confirm";
                        });
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade300,
                padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                alignment: Alignment.bottomRight,
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('1'), child: Text('1'))),
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('2'), child: Text('2'))),
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('3'), child: Text('3'))),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('4'), child: Text('4'))),
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('5'), child: Text('5'))),
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('6'), child: Text('6'))),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('7'), child: Text('7'))),
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('8'), child: Text('8'))),
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('9'), child: Text('9'))),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: Container(color: Colors.pink.shade200,)),
                        Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('0'), child: Text('0'))),
                        Expanded(child: Container(child: IconButton(onPressed: () => deleteNumber(), icon: Icon(Icons.backspace))))
                      ],
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: saving ? null : _saveToFirestore,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(102, 103, 170, 1),
                        ),
                        child: Text(
                          saving ? 'Saving...' : 'Confirm',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
  void showDialog2() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromRGBO(102, 103, 170, 1)
                    ),
                    child: Image.asset('assets/images/cong.png'),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    'Password Update',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'You\'ve updated password\nsuccessfully',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(96, 96, 96, 1)
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(102, 103, 170, 1)
                    ),
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
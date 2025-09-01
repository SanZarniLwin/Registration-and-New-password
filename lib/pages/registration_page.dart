import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/pages/otp_page.dart';
import 'package:registration_forgetpassword/pages/getstart_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final businessNameController = TextEditingController();
  final businessTypeController = TextEditingController();
  final contactNameController = TextEditingController();
  final contactPhoneController = TextEditingController();
  final messageController = TextEditingController();

  bool agreed = false;
  bool saving = false;

  @override
  void dispose() {
    businessNameController.dispose();
    businessTypeController.dispose();
    contactNameController.dispose();
    contactPhoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> _saveToFirestore() async {
    setState(() => saving = true);
    try {
      if (businessNameController.text.trim().isEmpty ||
          businessTypeController.text.trim().isEmpty ||
          contactNameController.text.trim().isEmpty ||
          contactPhoneController.text.trim().isEmpty) {
        throw Exception('Please fill all required fields.');
      }
      if (!agreed) {
        throw Exception('You must agree to the Terms and Conditions.');
      }

      await FirebaseFirestore.instance.collection('regi').add({
        'businessName': businessNameController.text.trim(),
        'businessType': businessTypeController.text.trim(),
        'contactName': contactNameController.text.trim(),
        'contactPhone': contactPhoneController.text.trim(),
        'message': messageController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('Data saved successfully!');

      showDialog2();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Save failed: $e')),
      );
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(70, 15, 70, 30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/regiBg.png'),
                    fit: BoxFit.fitWidth,
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
                                  return GetstartPage();
                                },
                              )
                            );
                          }, 
                          icon: Image.asset('assets/images/back.png')
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Application',
                          style: TextStyle(
                            fontSize: 28,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Register Your Business',
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'your pay',
                          style: TextStyle(
                            fontSize: 32,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 9,),
                            Text(
                              'Mo payment',
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 70, right: 70,),
                child: Column(
                  spacing: 15,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 1300,
                      child: Text(
                        'Business Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                      )
                    ),
                    TextField(
                      controller: businessNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(
                      width: 1300,
                      child: Text(
                        'Business Type',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                      )
                    ),
                    TextField(
                      controller: businessTypeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(
                      width: 1300,
                      child: Text(
                        'Contact Person Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                      )
                    ),
                    TextField(
                      controller: contactNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(
                      width: 1300,
                      child: Text(
                        'Contact Person Phone Number',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                      )
                    ),
                    TextField(
                      controller: contactPhoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(
                      width: 1300,
                      child: Text(
                        'Message',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(96, 96, 96, 1),
                        ),
                      )
                    ),
                    TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: agreed,
                          onChanged: (v) => setState(() => agreed = v ?? false),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context, 
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  actions: [
                                    Container(
                                    padding: EdgeInsets.fromLTRB(25, 8, 25, 30),
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context, MaterialPageRoute(
                                                    builder: (context) {
                                                      return RegistrationPage();
                                                    },
                                                  )
                                                );
                                              }, 
                                              icon: Image.asset('assets/images/x.png')
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 8,),
                                        Text(
                                          'Terms and Conditions',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300,
                                            color: const Color.fromRGBO(0, 0, 0, 1)
                                          ),
                                        ),
                                        SizedBox(height: 50,),
                                        Text(
                                          'It is a long established fact that a reader will be\ndistracted by the readable content of a page\nwhen looking at its layout.',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                            color: Color.fromRGBO(96, 96, 96, 1)
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          '(1). The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                            color: Color.fromRGBO(96, 96, 96, 1)
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          '(2). The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                            color: Color.fromRGBO(96, 96, 96, 1)
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          '(3). The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                            color: Color.fromRGBO(96, 96, 96, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ],
                                );
                              },
                            );
                          }, 
                          child: Text('I agree with the Terms and Conditions')
                        ),
                      ],
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color.fromRGBO(102, 103, 170, 1),
                        fixedSize: Size(1300, 50),
                      ),
                      onPressed: saving
                        ? null
                        : () async {
                            await _saveToFirestore();
                          }, 
                      child: Text(saving ? 'Saving...' : 'Next')
                    ),
                  ],
                ),
              )
            ],
          ),
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
                    'Congrats',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Your account is successfully\nregistered',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(96, 96, 96, 1)
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context, MaterialPageRoute(
                                builder: (context) {
                                  return OTPPage();
                                },
                              )
                            );
                          },
                          child: Container(
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
                          ),
                        ),
                      ),
                    ],
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
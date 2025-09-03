import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/pages/ID_verify_page.dart';
import 'package:registration_forgetpassword/pages/otp_page.dart';
import 'package:registration_forgetpassword/pages/security_question_page.dart';

class PassportPage extends StatefulWidget {
  const PassportPage({super.key});

  @override
  State<PassportPage> createState() => _PassportPageState();
}

class _PassportPageState extends State<PassportPage> {

  final passportCrt = TextEditingController();

  bool saving = false;

  @override
  void dispose() {
    passportCrt.dispose();
    super.dispose();
  }

  Future<void> _savePassportToFirestore () async {
    setState(() => saving = true,);
    try {
      if (passportCrt.text.trim().isEmpty) {
        throw Exception('Please enter Passport Number');
      }

      await FirebaseFirestore.instance.collection('passport').add({
        'passportNumber': passportCrt.text.trim(),
        'createAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved successfully'))
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) {
            return SecurityQuestionPage();
          },
        )
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved failed: $e'))
      );
    } finally {
      if (mounted) setState(() => saving = false,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/otpBg.png'),
                fit: BoxFit.fitWidth,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(
                        builder: (context) {
                          return OTPPage();
                        },
                      )
                    );
                  }, 
                  icon: Image.asset('assets/images/back.png')
                ),
                SizedBox(height: 20,),
                Text(
                  'ID Verification',
                  style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'Please fill NRC information to confirm\nidentity of wallet user',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border(
                          right: BorderSide(
                            color: Colors.white,
                          ),
                          bottom: BorderSide(
                            color: Colors.white
                          )
                        )
                      ),
                      child: Text(
                        '2/3',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              alignment: Alignment.center,
              child: Column(
                spacing: 30,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'NRC/Passport'
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(194, 194, 194, 1),
                            fixedSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) {
                                  return IdVerifyPage();
                                },
                              )
                            );
                          }, 
                          child: Text(
                            'NRC',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(194, 194, 194, 1),
                            fixedSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) {
                                  return PassportPage();
                                },
                              )
                            );
                          }, 
                          child: Text(
                            'Passport',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                    'Passport Number'
                    )
                  ),
                  TextField(
                    controller: passportCrt,
                    decoration: InputDecoration(
                      labelText: 'Please Enter Passport Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  GestureDetector(
                    onTap: saving 
                        ? null 
                        : () async {
                        await _savePassportToFirestore();
                      },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(102, 103, 170, 1)
                      ),
                      child: Text(
                        saving ? 'Saving...': 'Next',
                        style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
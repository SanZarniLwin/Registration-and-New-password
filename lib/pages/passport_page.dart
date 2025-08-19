import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/data/constant.dart';
import 'package:registration_forgetpassword/pages/ID_verify_page.dart';
import 'package:registration_forgetpassword/pages/otp_page.dart';
import 'package:registration_forgetpassword/pages/security_question_page.dart';

class PassportPage extends StatefulWidget {
  const PassportPage({super.key});

  @override
  State<PassportPage> createState() => _PassportPageState();
}

class _PassportPageState extends State<PassportPage> {
  String? menuItem = 'e1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              color: Colors.deepPurple.shade400,
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => OTPPage(),
                          )
                        );
                      }, 
                      icon: Icon(Icons.arrow_back, color: Colors.white,)
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'ID Verification',
                      style: KTextStyle.regi1,
                      )
                  ),
                  SizedBox(height: 15,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please fill NRC information to confirm\nidentity of waller user',
                      style: KTextStyle.regi2,
                    )
                  )
                ],
              ),
            ),
            Container(
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
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade100,
                          fixedSize: Size(570, 50),
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
                        child: Text('NRC'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade100,
                          fixedSize: Size(570, 50),
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
                        child: Text('Passport'),
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
                    decoration: InputDecoration(
                      labelText: 'Please Enter Passport Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        fixedSize: Size(1250, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) {
                            return SecurityQuestionPage();
                          },
                        )
                      );
                    }, 
                    child: Text('Next')
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
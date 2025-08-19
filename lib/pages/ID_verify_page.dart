import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/data/constant.dart';
import 'package:registration_forgetpassword/pages/otp_page.dart';
import 'package:registration_forgetpassword/pages/passport_page.dart';
import 'package:registration_forgetpassword/pages/security_question_page.dart';

class IdVerifyPage extends StatefulWidget {
  const IdVerifyPage({super.key});

  @override
  State<IdVerifyPage> createState() => _IdVerifyPageState();
}

class _IdVerifyPageState extends State<IdVerifyPage> {
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
                    'NRC Number'
                    )
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Container(
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          value: menuItem,
                          items: [
                            DropdownMenuItem(
                              value: 'e1',
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 'e2',
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 'e3',
                              child: Text('3'),
                            ),
                            DropdownMenuItem(
                              value: 'e4',
                              child: Text('4'),
                            ),
                            DropdownMenuItem(
                              value: 'e5',
                              child: Text('5'),
                            ),
                            DropdownMenuItem(
                              value: 'e6',
                              child: Text('6'),
                            ),
                            DropdownMenuItem(
                              value: 'e7',
                              child: Text('7'),
                            ),
                            DropdownMenuItem(
                              value: 'e8',
                              child: Text('8'),
                            ),
                            DropdownMenuItem(
                              value: 'e9',
                              child: Text('9'),
                            ),
                            DropdownMenuItem(
                              value: 'e10',
                              child: Text('10'),
                            ),
                            DropdownMenuItem(
                              value: 'e11',
                              child: Text('11'),
                            ),
                            DropdownMenuItem(
                              value: 'e12',
                              child: Text('12'),
                            ),
                            DropdownMenuItem(
                              value: 'e13',
                              child: Text('13'),
                            ),
                            DropdownMenuItem(
                              value: 'e14',
                              child: Text('14'),
                            ),
                          ], 
                          onChanged: (String? value) {
                            setState(() {
                              menuItem = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 720,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          value: menuItem,
                          items: [
                            DropdownMenuItem(
                              value: 'e1',
                              child: Text('Kachin'),
                            ),
                            DropdownMenuItem(
                              value: 'e2',
                              child: Text('Kayah'),
                            ),
                            DropdownMenuItem(
                              value: 'e3',
                              child: Text('Kayin'),
                            ),
                            DropdownMenuItem(
                              value: 'e4',
                              child: Text('Chin'),
                            ),
                            DropdownMenuItem(
                              value: 'e5',
                              child: Text('Sagaing'),
                            ),
                            DropdownMenuItem(
                              value: 'e6',
                              child: Text('Tanintharyi'),
                            ),
                            DropdownMenuItem(
                              value: 'e7',
                              child: Text('Bago'),
                            ),
                            DropdownMenuItem(
                              value: 'e8',
                              child: Text('Magway'),
                            ),
                            DropdownMenuItem(
                              value: 'e9',
                              child: Text('Mandalay'),
                            ),
                            DropdownMenuItem(
                              value: 'e10',
                              child: Text('Mon'),
                            ),
                            DropdownMenuItem(
                              value: 'e11',
                              child: Text('Rakhine'),
                            ),
                            DropdownMenuItem(
                              value: 'e12',
                              child: Text('Yangon'),
                            ),
                            DropdownMenuItem(
                              value: 'e13',
                              child: Text('Shan'),
                            ),
                            DropdownMenuItem(
                              value: 'e14',
                              child: Text('Ayeyarwady'),
                            ),
                          ], 
                          onChanged: (String? value) {
                            setState(() {
                              menuItem = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          value: menuItem,
                          items: [
                            DropdownMenuItem(
                              value: 'e1',
                              child: Text('N'),
                            ),
                            DropdownMenuItem(
                              value: 'e2',
                              child: Text('E'),
                            ),
                          ], 
                          onChanged: (String? value) {
                            setState(() {
                              menuItem = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Please Enter NRC Number',
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
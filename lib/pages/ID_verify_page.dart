import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/pages/otp_page.dart';
import 'package:registration_forgetpassword/pages/passport_page.dart';
import 'package:registration_forgetpassword/pages/security_question_page.dart';

class IdVerifyPage extends StatefulWidget {
  const IdVerifyPage({super.key});

  @override
  State<IdVerifyPage> createState() => _IdVerifyPageState();
}

class _IdVerifyPageState extends State<IdVerifyPage> {

  final nrcController = TextEditingController();

  String? menuItem = 'e1';

  @override
  void dispose() {
    nrcController.dispose();
    super.dispose();
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
                    controller: nrcController,
                    decoration: InputDecoration(
                      labelText: 'Please Enter NRC Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) {
                            return const SecurityQuestionPage();
                          },
                        )
                      );
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
                        'Next',
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
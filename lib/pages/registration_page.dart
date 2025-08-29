import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/pages/otp_page.dart';
import 'package:registration_forgetpassword/pages/getstart_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
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
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color.fromRGBO(102, 103, 170, 1),
                        fixedSize: Size(1300, 50),
                      ),
                      onPressed: () {
                        showDialog2();
                      }, 
                      child: Text('Next')
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
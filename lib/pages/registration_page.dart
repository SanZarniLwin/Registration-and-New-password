import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/data/constant.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              color: Colors.deepPurple.shade400,
              child: Column(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const GetstartPage();
                              },
                            ));
                          },
                          icon: const Icon(Icons.arrow_back, color: Colors.white,),
                        ),
                      ),
                      Container(
                        width: 1000,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [ 
                            Text(
                                'your pay',
                                style: KTextStyle.regi1,
                              ),
                              SizedBox(height: 5,),
                            Text(
                              '     Mo payment',
                              style: KTextStyle.regi2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                              Text(
                                'Application',
                                style: KTextStyle.regi1,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                '     Register Your Business',
                                style: KTextStyle.regi2,
                              ),
                              
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 70, right: 70,),
              child: Column(
                spacing: 15,
                children: [
                  SizedBox(height: 20),
                  Container(
                    width: 1300,
                    child: Text(
                      'Business Name'
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
                      'Business Type'
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
                      'Contact Person Name'
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
                      'Contact Person Phone Number'
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
                      'Message'
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
                          return Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                }, 
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                                ),
                              ),
                              AlertDialog(
                                title: Text('Terms and Conditions'),
                                content: Text(
                                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\n\n(1). The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a\n\n(2). The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a'
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
                      backgroundColor: Colors.deepPurple,
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
    );
  }
  void showDialog2() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Congrats!'),
        content: Text('Your account is successfully\n registered.'),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) {
                    return OTPPage();
                  },
                )
              );
            }, 
            child: Text('Ok'),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              fixedSize: Size(300, 30)
            ),
          ),
        ],
      ),
    );
  }
}
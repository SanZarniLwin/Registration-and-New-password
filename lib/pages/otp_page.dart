import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/data/constant.dart';
import 'package:registration_forgetpassword/pages/ID_verify_page.dart';
import 'package:registration_forgetpassword/pages/registration_page.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                          builder: (context) => RegistrationPage(),
                        )
                      );
                    }, 
                    icon: Icon(Icons.arrow_back, color: Colors.white,)
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'OTP Verification',
                    style: KTextStyle.regi1,
                    )
                ),
                SizedBox(height: 15,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'We have sent you a SMS on your phone\nnumber',
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
                Text('09*****648'),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
                Text('If you don\'t receive the code!'),
                Text('Resend OTP(59s)'),
                SizedBox(height: 60),
                FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      fixedSize: Size(1300, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) {
                          return const IdVerifyPage();
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
    );
  }
}
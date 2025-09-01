import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/pages/ID_verify_page.dart';
import 'package:registration_forgetpassword/pages/registration_page.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

  TextEditingController otpController = TextEditingController();

  String confirmOTP = '1234';

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                          return RegistrationPage();
                        },
                      )
                    );
                  }, 
                  icon: Image.asset('assets/images/back.png')
                ),
                SizedBox(height: 20,),
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'We have sent you a SMS on your phone\nnumber',
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
                          )
                        )
                      ),
                      child: Text(
                        '1/3',
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
              spacing: 20,
              children: [
                Text(
                  '09*****648',
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(96, 96, 96, 1)
                  ),
                ),
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
                Text(
                  'If you don\'t receive the code!',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(96, 96, 96, 1)
                  ),
                ),
                Text(
                  'Resend OTP(59s)',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(102, 103, 170, 1)
                  ),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    if (confirmOTP == otpController.text.trim()) {
                      Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(
                          builder: (context) {
                            return IdVerifyPage();
                          },
                        ),
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid OTP, please try again'))
                      );
                    }
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
    );
  }
}
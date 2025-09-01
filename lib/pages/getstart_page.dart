import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/pages/registration_page.dart';

class GetstartPage extends StatefulWidget {
  const GetstartPage({super.key});

  @override
  State<GetstartPage> createState() => _GetstartPageState();
}

class _GetstartPageState extends State<GetstartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(30, 45, 30, 20),
        child: Column(
          children: [
            Text(
              'Make payments anywhere\nwith any currency',
              style: TextStyle(
                fontSize: 32,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Shop the world without restrictions',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(96, 96, 96, 1)
              ),
            ),
            SizedBox(height: 35,),
            Image.asset('assets/images/welcome.png'),
            SizedBox(height: 10,),
            Container(
              height: 5,
              width: 70,
              color: Color.fromRGBO(102, 103, 170, 1),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context, MaterialPageRoute(
                    builder: (context) {
                      return RegistrationPage();
                    },
                  )
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color.fromRGBO(102, 103, 170, 1)
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/data/constant.dart';
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
        padding: const EdgeInsets.only(left: 60, right: 60,),
        color: const Color.fromARGB(183, 236, 243, 228),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Container(
              width: 1300,
              child: Text(
                "Make payments anywhere",
                style: KTextStyle.getStart1,
              ),
            ),
            //SizedBox(height: 10),
            Container(
              width: 1300,
              child: Text(
                'with any currency',
                style: KTextStyle.getStart1,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 1300,
              child: Text(
                'Shop the world without restrictions',
                style: KTextStyle.getStart2,
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Image(
                image: AssetImage('assets/images/welcome.jpg'),
                height: 300,
              ),
            ),
            SizedBox(height: 40),
            FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: Size(1300, 50),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) {
                          return const RegistrationPage();
                        },
                      )
                    );
                  },
                  child: Text("Get Started")
                ),
          ],
        ),
      ),
    );
  }
}
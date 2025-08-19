import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/data/constant.dart';
import 'package:registration_forgetpassword/pages/security_question_page.dart';

class NewPwPage extends StatefulWidget {
  const NewPwPage({super.key});

  @override
  State<NewPwPage> createState() => _NewPwPageState();
}

class _NewPwPageState extends State<NewPwPage> {
  String displayText = '';
  final TextEditingController controllerNPw = TextEditingController();
  final TextEditingController controllerCPw = TextEditingController();
  String activeField = "new";

  void onNumberPressed(String number) {
    setState(() {
      if (activeField == "new") {
        controllerNPw.text += number;
      } else {
        controllerCPw.text += number;
      }
    });
  }

  void deleteNumber() {
    setState(() {
      if (activeField == "new" && controllerNPw.text.isNotEmpty) {
        controllerNPw.text =
            controllerNPw.text.substring(0, controllerNPw.text.length - 1);
      } else if (activeField == "confirm" && controllerCPw.text.isNotEmpty) {
        controllerCPw.text =
            controllerCPw.text.substring(0, controllerCPw.text.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Container(
              height: 180,
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
                            builder: (context) => SecurityQuestionPage(),
                          )
                        );
                      }, 
                      icon: Icon(Icons.arrow_back, color: Colors.white,)
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Create New Password',
                      style: KTextStyle.regi1,
                      )
                  ),
                  SizedBox(height: 15,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'It will used for payment and send money',
                      style: KTextStyle.regi2,
                    )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red.shade300,
                    child: Row(
                      children: [
                        Text(
                          '!', style: TextStyle(
                            fontSize: 42,
                          ),
                        ),
                        Text(
                          'New password must be different from\nprevious password'
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('New Password'),
                  ),
                  TextField(
                    controller: controllerNPw,
                    readOnly:
                        true,
                    onTap: () {
                      setState(() {
                        activeField = "new";
                      });
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Confirmed password'),
                  ),
                 TextField(
                    controller: controllerCPw,
                    readOnly: true,
                    onTap: () {
                      setState(() {
                        activeField = "confirm";
                      });
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade300,
              padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
              alignment: Alignment.bottomRight,
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('1'), child: Text('1'))),
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('2'), child: Text('2'))),
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('3'), child: Text('3'))),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('4'), child: Text('4'))),
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('5'), child: Text('5'))),
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('6'), child: Text('6'))),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('7'), child: Text('7'))),
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('8'), child: Text('8'))),
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('9'), child: Text('9'))),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Container(color: Colors.pink.shade200,)),
                      Expanded(child: ElevatedButton(onPressed: () => onNumberPressed('0'), child: Text('0'))),
                      Expanded(child: Container(child: IconButton(onPressed: () => deleteNumber(), icon: Icon(Icons.backspace))))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}
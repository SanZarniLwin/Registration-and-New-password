import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/pages/ID_verify_page.dart';
import 'package:registration_forgetpassword/pages/new_pw_page.dart';

class SecurityQuestionPage extends StatefulWidget {
  const SecurityQuestionPage({super.key});

  @override
  State<SecurityQuestionPage> createState() => _SecurityQuestionPageState();
}

class _SecurityQuestionPageState extends State<SecurityQuestionPage> {
  int expandedIndex = 1;
  final TextEditingController colorCtrl = TextEditingController();
  final TextEditingController foodCtrl = TextEditingController();
  final TextEditingController personCtrl = TextEditingController();

  @override
  void dispose() {
    colorCtrl.dispose();
    foodCtrl.dispose();
    personCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveSecurityQuestions() async {
    Map<String, String> answerQuestions = {};
    if (colorCtrl.text.isNotEmpty) {
      answerQuestions['favorite_color'] = colorCtrl.text;
    }
    if (foodCtrl.text.isNotEmpty) {
      answerQuestions['favorite_food'] = foodCtrl.text;
    }
    if (personCtrl.text.isNotEmpty) {
      answerQuestions['favorite_person'] = personCtrl.text;
    }

    try {
      await FirebaseFirestore.instance.collection('security_questions').add({
        'answers': answerQuestions,
        'createAt': FieldValue.serverTimestamp(),
      });
      print('Security questions saved to Firestore successfully.');
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved failed'))
      );
    }
  }

  bool _isAtLeastOneAnswered() {
    return colorCtrl.text.isNotEmpty ||
          foodCtrl.text.isNotEmpty ||
          personCtrl.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
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
                              return IdVerifyPage();
                            },
                          )
                        );
                      }, 
                      icon: Image.asset('assets/images/back.png')
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Security Question',
                      style: TextStyle(
                        fontSize: 28,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'Please enter security questions, you can\nanswer one out of questions',
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
                            '3/3',
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
              Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25, left: 20),
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Color.fromRGBO(102, 103, 170, 1)
                                          ),
                                          child: Image.asset('assets/images/check.png'),
                                        ),
                                      ),
                                      SizedBox(width: 9,),
                                      Flexible(
                                        child: _questionTile(
                                          title: 'What is your favourite color?', 
                                          index: 0,
                                          expandedChild: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              16, 12, 16, 16
                                            ),
                                            child: TextField(
                                              controller: colorCtrl,
                                              decoration: const InputDecoration(
                                                hintText: 'Type your answer here...',
                                              border: OutlineInputBorder(),
                                              isDense: true,
                                              ),
                                            ),
                                          ),
                                          activeColor: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(height: 1,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25, left: 20),
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Color.fromRGBO(102, 103, 170, 1)
                                          ),
                                          child: Image.asset('assets/images/check.png'),
                                        ),
                                      ),
                                      SizedBox(width: 9,),
                                      Flexible(
                                        child: _questionTile(
                                          title: 'What is your favourite food?', 
                                          index: 1,
                                          expandedChild: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              16, 12, 16, 16
                                            ),
                                            child: TextField(
                                              controller: foodCtrl,
                                              decoration: const InputDecoration(
                                                hintText: 'Type your answer here...',
                                              border: OutlineInputBorder(),
                                              isDense: true,
                                              ),
                                            ),
                                          ),
                                          activeColor: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(height: 1,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25, left: 20),
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Color.fromRGBO(102, 103, 170, 1)
                                          ),
                                          child: Image.asset('assets/images/check.png'),
                                        ),
                                      ),
                                      SizedBox(width: 9,),
                                      Flexible(
                                        child: _questionTile(
                                          title: 'What is your favourite person?', 
                                          index: 2,
                                          expandedChild: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              16, 12, 16, 16
                                            ),
                                            child: TextField(
                                              controller: personCtrl,
                                              decoration: const InputDecoration(
                                                hintText: 'Type your answer here...',
                                              border: OutlineInputBorder(),
                                              isDense: true,
                                              ),
                                            ),
                                          ),
                                          activeColor: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox( height: 300,),
                                  GestureDetector(
                                    onTap: () async {
                                      if (_isAtLeastOneAnswered()) {
                                        await _saveSecurityQuestions();
                                        Navigator.push(
                                          context, MaterialPageRoute(
                                            builder: (context) {
                                              return const NewPwPage();
                                            },
                                          )
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Please answer at least one question'),)
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
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _questionTile({
    required String title,
    required int index,
    Widget? expandedChild,
    Color? activeColor,
  }) {
    final isExpanded = expandedIndex == index;
    return ExpansionTile(
      initiallyExpanded: isExpanded,
      maintainState: true,
      onExpansionChanged: (open) {
        if (mounted) {
          setState(() {
            expandedIndex = open ? index : -1;
          });
        }
      },
      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      childrenPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w300,
          color: Color.fromRGBO(102, 103, 170, 1)
        ),
      ),
      trailing: Icon(
        isExpanded ? Icons.expand_less : Icons.expand_more,
      ),
      children: expandedChild != null ? [expandedChild] : const [],
    );
  }
}
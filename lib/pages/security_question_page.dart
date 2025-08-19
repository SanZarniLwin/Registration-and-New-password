import 'package:flutter/material.dart';
import 'package:registration_forgetpassword/data/constant.dart';
import 'package:registration_forgetpassword/pages/ID_verify_page.dart';
import 'package:registration_forgetpassword/pages/new_pw_page.dart';

class SecurityQuestionPage extends StatefulWidget {
  const SecurityQuestionPage({super.key});

  @override
  State<SecurityQuestionPage> createState() => _SecurityQuestionPageState();
}

class _SecurityQuestionPageState extends State<SecurityQuestionPage> {
  int expandedIndex = 1;
  final TextEditingController answerCtrl = TextEditingController();

  @override
  void dispose() {
    answerCtrl.dispose();
    super.dispose();
  }

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
                            builder: (context) => IdVerifyPage(),
                          )
                        );
                      }, 
                      icon: Icon(Icons.arrow_back, color: Colors.white,)
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Security Question',
                      style: KTextStyle.regi1,
                      )
                  ),
                  SizedBox(height: 15,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please enter security questions, you can\nanswer one out of questions',
                      style: KTextStyle.regi2,
                    )
                  ),
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
                                _questionTile(
                                  title: 'What is your favourite color?', 
                                  index: 0,
                                  expandedChild: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      16, 12, 16, 16
                                    ),
                                    child: TextField(
                                      controller: answerCtrl,
                                      decoration: const InputDecoration(
                                        hintText: 'Type your answer here...',
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      ),
                                    ),
                                  ),
                                  activeColor: Colors.purple,
                                ),
                                const Divider(height: 1,),
                                _questionTile(
                                  title: 'What is your favourite food?', 
                                  index: 0,
                                  expandedChild: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      16, 12, 16, 16
                                    ),
                                    child: TextField(
                                      controller: answerCtrl,
                                      decoration: const InputDecoration(
                                        hintText: 'Type your answer here...',
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      ),
                                    ),
                                  ),
                                  activeColor: Colors.purple,
                                ),
                                _questionTile(
                                  title: 'What is your favourite person?', 
                                  index: 0,
                                  expandedChild: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      16, 12, 16, 16
                                    ),
                                    child: TextField(
                                      controller: answerCtrl,
                                      decoration: const InputDecoration(
                                        hintText: 'Type your answer here...',
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      ),
                                    ),
                                  ),
                                  activeColor: Colors.purple,
                                ),
                                FilledButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) {
                                          return NewPwPage();
                                        },
                                      )
                                    );
                                  }, 
                                  style: FilledButton.styleFrom(
                                    fixedSize: Size(1300, 50),
                                    backgroundColor: Colors.deepPurple
                                  ),
                                  child: Text('Next')
                                )
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
      title: Text(title),
      trailing: Icon(
        isExpanded ? Icons.expand_less : Icons.expand_more,
      ),
      children: expandedChild != null ? [expandedChild] : const [],
    );
  }
}
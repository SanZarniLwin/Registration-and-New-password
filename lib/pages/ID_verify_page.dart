import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  String prefix = '1';
  String region = 'Kachin';
  String suffix = 'N';

  bool saving = false;

  final List<String> prefixes = List.generate(14, (i) => '${i + 1}');
  final List<String> regions = [
    'Kachin', 'Kayah', 'Kayin', 'Chin', 'Sagaing', 'Tanintharyi', 'Bago', 
    'Magway', 'Mandalay', 'Mon', 'Rakhine', 'Yangon', 'Shan', 'Ayeyarwady'
  ];
  final List<String> suffixes = ['N', 'E'];

  @override
  void dispose() {
    nrcController.dispose();
    super.dispose();
  }

  Future<void> _saveIdToFirestore() async {
    final String nrc = nrcController.text.trim();
    if (!RegExp(r'^\d{6}$').hasMatch(nrc)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('NRC number must be exactly 6 digits.')),
      );
      return;
    }

    setState(() {
      saving = true;
    });

    try {
      final String fullNRC = '$prefix/$region($suffix)$nrc';

      await FirebaseFirestore.instance.collection('nrcID').add({
        'prefix': prefix,
        'region': region,
        'suffix': suffix,
        'nrc': nrc,
        'fullNRC': fullNRC,
        'createAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved successfully')),
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) {
            return SecurityQuestionPage();
          },
        )
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Save failed: $e')),
      );
    } finally {
      if (mounted) setState(() => saving = false);
    }

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
                    children: [
                      SizedBox(
                        width: 120,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: prefix,
                            underline: const SizedBox(),
                            items: prefixes
                                  .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                                  .toList(),
                            onChanged: (v) {
                              setState(() {
                                prefix = v ?? prefix;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: region,
                            underline: const SizedBox(),
                            items: regions
                                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                                  .toList(),
                            onChanged: (v) {
                              setState(() {
                                region = v ?? region;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12,),
                      SizedBox(
                        width: 100,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: suffix,
                            underline: const SizedBox(),
                            items: suffixes
                                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                                  .toList(),
                            onChanged: (v) {
                              setState(() {
                                suffix = v ?? suffix;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: nrcController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Please Enter NRC Number',
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                  ),
                  const SizedBox(width: 20,),
                  GestureDetector(
                    onTap: saving 
                        ? null 
                        : () async {
                        await _saveIdToFirestore();
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
                        saving ? 'Saving...': 'Next',
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
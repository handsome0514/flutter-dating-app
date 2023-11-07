import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:bematched/ui/gender/gender_screen.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  TextEditingController EmailController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  LinearProgressIndicator(
                    backgroundColor: Color(0xFFD9D9D9),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.black,
                    ),
                    value: 0.25,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What is your email?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                      ]),
                      obscureText: true,
                      controller: EmailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your email',
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '2 / 8',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          child: const Text(
                            'Next',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            // if (formkey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GenderScreen(),
                              ),
                            );
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColor,
                            minimumSize: const Size.fromHeight(50),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

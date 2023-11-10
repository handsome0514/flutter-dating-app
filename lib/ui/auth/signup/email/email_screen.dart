import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:bematched/config.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  EmailScreenState createState() => EmailScreenState();
}

class EmailScreenState extends State<EmailScreen> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const LinearProgressIndicator(
                  backgroundColor: Color(0xFFD9D9D9),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black,
                  ),
                  value: 0.25,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
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
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                  ]),
                  obscureText: true,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email',
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '2 / 8',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
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
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

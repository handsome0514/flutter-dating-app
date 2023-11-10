import 'package:flutter/material.dart';
import 'package:bematched/config.dart';
import 'package:bematched/constants/color.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class BirthScreen extends StatefulWidget {
  const BirthScreen({super.key});

  @override
  BirthScreenState createState() => BirthScreenState();
}

class BirthScreenState extends State<BirthScreen> {
  TextEditingController dateinput = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    dateinput.text = "";
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
                    value: 0.5,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What is your birthday?',
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
                    // obscureText: true,
                    controller: dateinput,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Enter your date of birth",
                      suffixIcon: IconButton(
                        onPressed: () => setState(() {
                          // hidden = !hidden;
                        }),
                        icon: const Icon(
                          Icons.calendar_today,
                          color: themeColor,
                        ),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              1990), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2050),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: themeColor, // <-- SEE HERE
                                  onPrimary: Colors.white, // <-- SEE HERE
                                  onSurface: themeColor, // <-- SEE HERE
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: themeColor,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          });

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      }
                    },
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '4 / 8',
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
                            if (formkey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PictureScreen(),
                                ),
                              );
                            }
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
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';
import 'package:bematched/ui/picture/picture_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class BirthScreen extends StatefulWidget {
  @override
  _BirthScreenState createState() => _BirthScreenState();
}

class _BirthScreenState extends State<BirthScreen> {
  TextEditingController dateinput = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    dateinput.text = "";
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
                      value: 0.5,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
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
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                        ]),
                        // obscureText: true,
                        controller: dateinput,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
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
                                    colorScheme: ColorScheme.light(
                                      primary: themeColor, // <-- SEE HERE
                                      onPrimary: Colors.white, // <-- SEE HERE
                                      onSurface: themeColor, // <-- SEE HERE
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        primary:
                                            themeColor, // button text color
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
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '4 / 8',
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
                              if (formkey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PictureScreen(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor,
                              minimumSize: const Size.fromHeight(50),
                            ))
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

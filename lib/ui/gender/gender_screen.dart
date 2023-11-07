import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';
import 'package:bematched/ui/birth/birth_screen.dart';

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String gender_type = "male";
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
                  value: 0.375,
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What is your gender?',
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
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            gender_type = "female";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: (gender_type == "female")
                                  ? themeColor
                                  : Colors.white,
                              border: Border.all(
                                  color: (gender_type == "female")
                                      ? themeColor
                                      : Color(0xFFD9D9D9)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: (gender_type == "female")
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              Spacer(),
                              Icon(
                                Icons.done,
                                color: (gender_type == "female")
                                    ? Colors.white
                                    : Color(0xFFADAFBB),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            gender_type = "male";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: (gender_type == "male")
                                  ? themeColor
                                  : Colors.white,
                              border: Border.all(
                                  color: (gender_type == "male")
                                      ? themeColor
                                      : Color(0xFFD9D9D9)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: (gender_type == "male")
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              Spacer(),
                              Icon(
                                Icons.done,
                                color: (gender_type == "male")
                                    ? Colors.white
                                    : Color(0xFFADAFBB),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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
                      '3 / 8',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BirthScreen(),
                            ),
                          );
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
    );
  }
}

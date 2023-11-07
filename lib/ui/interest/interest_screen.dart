import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';

class InterestScreen extends StatefulWidget {
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
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
                  value: 0.75,
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Interests',
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
                Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(0),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: (1 / .7),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE1E1E1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE1E1E1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE1E1E1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE1E1E1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 30,
                              ),
                              Text(
                                "Add Photo",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
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
                      '6 / 8',
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
                              builder: (context) => InterestScreen(),
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
    );
  }
}

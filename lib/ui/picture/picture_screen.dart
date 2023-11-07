import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';
import 'package:bematched/ui/email/email_screen.dart';

class PictureScreen extends StatefulWidget {
  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
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
                  value: 0.625,
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Add 2 or more pictures and videos',
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
                Container(),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '5 / 8',
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
                              builder: (context) => EmailScreen(),
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

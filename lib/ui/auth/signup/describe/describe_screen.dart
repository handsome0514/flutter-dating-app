import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';
import 'package:bematched/ui/auth/signup/location/location_screen.dart';

class DescribeScreen extends StatefulWidget {
  const DescribeScreen({super.key});

  @override
  DescribeScreenState createState() => DescribeScreenState();
}

class DescribeScreenState extends State<DescribeScreen> {
  TextEditingController describeController = TextEditingController();

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
                  value: 0.875,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Describe yourself in a few words',
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
                TextField(
                  // validator: MultiValidator([
                  //   RequiredValidator(errorText: "* Required"),
                  // ]),
                  // obscureText: true,
                  controller: describeController,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: 'Enter your answer',
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
                      '7 / 8',
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
                            builder: (context) => LocationScreen(),
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
                      ),
                    )
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

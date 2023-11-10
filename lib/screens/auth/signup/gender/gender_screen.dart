import 'package:bematched/config.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  GenderScreenState createState() => GenderScreenState();
}

class GenderScreenState extends State<GenderScreen> {
  String genderType = "male";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                value: 0.375,
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
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
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      setState(() {
                        genderType = "female";
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: (genderType == "female")
                              ? themeColor
                              : Colors.white,
                          border: Border.all(
                              color: (genderType == "female")
                                  ? themeColor
                                  : const Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 18,
                                color: (genderType == "female")
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.done,
                            color: (genderType == "female")
                                ? Colors.white
                                : const Color(0xFFADAFBB),
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        genderType = "male";
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: (genderType == "male")
                              ? themeColor
                              : Colors.white,
                          border: Border.all(
                              color: (genderType == "male")
                                  ? themeColor
                                  : const Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 18,
                                color: (genderType == "male")
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.done,
                            color: (genderType == "male")
                                ? Colors.white
                                : const Color(0xFFADAFBB),
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '3 / 8',
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
                        Get.to(
                          () => const BirthScreen(),
                          transition: Transition.rightToLeft,
                        );
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
    );
  }
}

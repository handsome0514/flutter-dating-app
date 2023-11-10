import 'package:bematched/config.dart';

class PictureScreen extends StatefulWidget {
  const PictureScreen({super.key});

  @override
  PictureScreenState createState() => PictureScreenState();
}

class PictureScreenState extends State<PictureScreen> {
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
                value: 0.625,
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
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
              const SizedBox(
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFE1E1E1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFE1E1E1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFE1E1E1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFE1E1E1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
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
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '5 / 8',
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
                        Get.to(
                          () => const InterestScreen(),
                          transition: Transition.rightToLeft,
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
    );
  }
}

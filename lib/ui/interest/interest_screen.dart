import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';
import 'package:bematched/ui/describe/describe_screen.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _InterestScreenState createState() => _InterestScreenState();
}

const List<Map<String, dynamic>> interests = <Map<String, dynamic>>[
  <String, dynamic>{
    'icon': Icons.photo_camera_outlined,
    'text': 'Photography',
  },
  <String, dynamic>{
    'icon': Icons.shopping_bag_outlined,
    'text': 'Shopping',
  },
  <String, dynamic>{
    'icon': Icons.mic_none_outlined,
    'text': 'Karaoke',
  },
  <String, dynamic>{
    'icon': Icons.more_horiz,
    'text': 'Yoga',
  },
  <String, dynamic>{
    'icon': Icons.cookie,
    'text': 'Cooking',
  },
  <String, dynamic>{
    'icon': Icons.more_horiz,
    'text': 'Tennis',
  },
  <String, dynamic>{
    'icon': Icons.run_circle,
    'text': 'Run',
  },
  <String, dynamic>{
    'icon': Icons.waves,
    'text': 'Swimming',
  },
  <String, dynamic>{
    'icon': Icons.art_track,
    'text': 'Art',
  },
  <String, dynamic>{
    'icon': Icons.travel_explore,
    'text': 'Travelling',
  },
  <String, dynamic>{
    'icon': Icons.more_horiz,
    'text': 'Extreme',
  },
  <String, dynamic>{
    'icon': Icons.queue_music,
    'text': 'Music',
  },
  <String, dynamic>{
    'icon': Icons.wine_bar_outlined,
    'text': 'Drink',
  },
  <String, dynamic>{
    'icon': Icons.videogame_asset,
    'text': 'Video games',
  },
];

class _InterestScreenState extends State<InterestScreen> {
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
                value: 0.75,
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
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
                  childAspectRatio: (1 / .3),
                  children: <Widget>[
                    for (int i = 0; i < interests.length; i++)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFFD9D9D9)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              interests[i]["icon"],
                              color: themeColor,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              interests[i]["text"],
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              // const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '6 / 8',
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
                          builder: (context) => DescribeScreen(),
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
    );
  }
}

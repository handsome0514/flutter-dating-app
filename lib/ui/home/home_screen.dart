import 'package:flutter/material.dart';
import 'package:bematched/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Welcolme to',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                      color: Colors.white),
                ),
                Center(
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Connecting Mongolians, One Swipe at a Time!',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      minimumSize: const Size.fromHeight(50),
                    ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}

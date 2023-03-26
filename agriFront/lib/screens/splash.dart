import 'package:agrifront/screens/loginScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componets/custom_page_route.dart';
import 'home.dart';
// import 'package:life_solutions/screens/family_s.dart';
// import 'package:life_solutions/screens/familysolutions.dart';
//import 'package:life_solutions/screens/familyissues.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    _navigatetohome();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    animationController.repeat();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context,
        CustomPageRoute(child: UserSignin(), direction: AxisDirection.left));
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Color.fromARGB(255, 16, 205, 16),
      Color.fromARGB(255, 2, 70, 172),
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
        fontSize: 36.0, fontFamily: 'Horizon', decoration: TextDecoration.none);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 120,
            left: 140,
            child: AnimatedTextKit(animatedTexts: [
              ColorizeAnimatedText(
                'Welcome',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ]),
            // child: Text(
            //   "Welcome",
            //   style: GoogleFonts.reggaeOne(
            //       fontSize: 36,
            //       decoration: TextDecoration.none,
            //       fontWeight: FontWeight.w700,
            //       fontStyle: FontStyle.italic,
            //       color: const Color.fromARGB(255, 9, 51, 31)),
            // ),
          ),
          Positioned(
            top: 180,
            left: 200,
            child: Text(
              "to",
              style: GoogleFonts.reggaeOne(
                  fontSize: 24,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 16, 205, 16)),
            ),
          ),
          Positioned(
            top: 230,
            left: 100,
            child: AnimatedTextKit(animatedTexts: [
              ColorizeAnimatedText(
                'Agri Solutions',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ]),
            // child: Text(
            //   "Life Solutions",
            //   style: GoogleFonts.reggaeOne(
            //       fontSize: 36,
            //       decoration: TextDecoration.none,
            //       fontWeight: FontWeight.w700,
            //       fontStyle: FontStyle.italic,
            //       color: const Color.fromARGB(255, 9, 51, 31)),
            // ),
          ),
          Positioned(
            top: 380,
            left: 55,
            child: Container(
              width: 325,
              height: 325,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/agrilogo.png'),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

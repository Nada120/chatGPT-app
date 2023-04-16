import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  bool _isWaiting = true;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 1000),
      () {
        setState(() {
          _isWaiting = false;
        });
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff02a67e),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assats/images/chatGPT.png',
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.5,
          ),
          _isWaiting? SizedBox.shrink()
          : Center(
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
              child: AnimatedTextKit(
              isRepeatingAnimation: false,
              repeatForever: false,
              pause: Duration(seconds: 1),
              totalRepeatCount: 1,
              animatedTexts: [
                TyperAnimatedText(
                  'Chat-GPT'.trim(),
                ),
              ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

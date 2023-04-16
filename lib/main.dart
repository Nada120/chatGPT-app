import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatgpt_app/constants/constants.dart';
import 'package:chatgpt_app/providers/chats_provider.dart';
import 'package:chatgpt_app/providers/models_provider.dart';
import 'package:chatgpt_app/screens/chat_screen.dart';
import 'package:chatgpt_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'ChatGPT App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            color: cardColor,
          ),
        ),
        home: AnimatedSplashScreen(
          splashIconSize: double.infinity,
          curve: Curves.easeIn,
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          splash: SplashScreen(),
          nextScreen: ChatScreen(),
        ),
      ),
    );
  }
}

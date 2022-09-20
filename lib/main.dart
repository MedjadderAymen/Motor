import 'package:flutter/material.dart';
import 'package:motar/screens/connexion/LoginScreen.dart';
import 'package:motar/screens/connexion/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen =  preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1); //if already shown -> 1 else 0
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? "onboard" : "onboard",
      routes: {
        'home':(context)=> LoginScreen(),
        'onboard':(context)=> OnBoardingScreen(),
      },
    );
  }
}

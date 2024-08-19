import 'package:flutter/material.dart';
import 'package:voice_chat/home_page.dart';
import 'package:voice_chat/pallette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true,).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: AppBarTheme(backgroundColor: Pallete.whiteColor)
        
        
      ),
      home: const HomePage(

      ),
    );
  }
}


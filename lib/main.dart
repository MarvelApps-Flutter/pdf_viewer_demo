import 'package:flutter/material.dart';
import 'package:flutter_pdf_preview/screens/splash_screen.dart';
import 'color/material_color.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Pdf Preview Module',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFe2e2e2)),
      ),
      home: const SplashScreen(),
    );
  }
}



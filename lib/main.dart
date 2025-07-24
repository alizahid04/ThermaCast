import 'package:flutter/material.dart';
import 'package:thermacast/Pages/Loading.dart';
import 'package:thermacast/Pages/home.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2193b0), // Dark sky blue
      statusBarIconBrightness: Brightness.light, // use dark icons for light background
    ),
  );

  {
    runApp(MaterialApp(
      routes: {
        "/": (context) => loading(),
        "/home": (context) => home(),
        "/loading": (context) => loading(),
      },
    ));
  }
}
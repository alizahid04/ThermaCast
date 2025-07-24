import 'package:flutter/material.dart';
import 'package:thermacast/Pages/Loading.dart';
import 'package:thermacast/Pages/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await dotenv.load();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2193b0),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(MaterialApp(
    routes: {
      "/": (context) => loading(),
      "/home": (context) => home(),
      "/loading": (context) => loading(),
    },
  ));
}

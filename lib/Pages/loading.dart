import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:thermacast/Packages/worker.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String temp = '';
  String humidity = '';
  String air_Speed = '';
  String desc = '';
  String main = '';
  String icon = '';
  String city = 'Faisalabad';


  @override
  void initState() {
    super.initState();
  }

  void startApp(String city) async {
    Worker instance = Worker(loc: city);
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    air_Speed = instance.airSpeed;
    desc = instance.description;
    main = instance.main;
    icon = instance.icon;
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        "temp": temp,
        "humidity": humidity,
        "airSpeed": air_Speed,
        "description": desc,
        "main": main,
        "icon" : icon,
        "city_value" : city,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map && args.containsKey('search_value')) {
      city = args['search_value'];
    }
    startApp(city);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'Assests/Images/app_logo.png',
                  height: 175,
                  width: 175,
                ),
                SizedBox(height: 12),
                Text(
                  "ThermaCast",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Made by Muhammad Ali",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1.0,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0.5, 0.5),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 40),
                SpinKitWave(color: Colors.blue.shade700, size: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

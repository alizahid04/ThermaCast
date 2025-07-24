import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Worker {
 late String location;
  Worker({String? loc}){
    location = loc ?? 'Faisalabad';
  }
  String temp = '';
  String humidity = '';
  String airSpeed = '';
  String description = '';
  String main = '';
  String icon = '';

  Future <void> getData() async {
    try{
      Response response = await get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=63e6bd7104b9da689080ba83f7780ee3&units=metric",
        ),
      );
      Map data = jsonDecode(response.body);

      // getting main map , temp and humidity
      Map temp_data = data['main'];
      double getTemp = temp_data['temp'];
      String getHumidity = temp_data['humidity'].toString();

      // getting air map and speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed'] * 3.6;

      // weather is in list
      // getting map from weather list and then main and descrtption
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];
      String get_Icon = weather_main_data['icon'].toString();

      //Assiging
      temp = getTemp.toString();
      humidity = getHumidity;
      airSpeed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
      icon = get_Icon;
    }catch(e){
      temp = 'Error';
      humidity = 'N/A';
      airSpeed = 'N/A';
      description = 'Unable to fetch';
      main = 'N/A';
      icon = '01d';
    }
  }
}

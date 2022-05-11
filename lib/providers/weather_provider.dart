import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  double temp=0;

  setTemp(double newTemp){
    temp=newTemp;
    notifyListeners();
  }
}

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherController {
  final WeatherRepository _weatherRepository = WeatherRepository();
  final StreamController _tempStream = StreamController<double?>();

  get tempStream => _tempStream.stream;

  Future<void> getTemperature() async{
    try {
      _tempStream.add(null);
       Map<String,dynamic> response= await _weatherRepository.fetchCurrentTemp();
       WeatherModel weather=WeatherModel.fromJson(response);
       _tempStream.add(weather.main!.temp!);
    } on DioError catch (e) {
      print(e.error);
    }
  }
}

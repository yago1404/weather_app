import 'dart:async';

import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherController {
  final WeatherRepository _weatherRepository = WeatherRepository();
  final StreamController _tempStream = StreamController<double?>();

  get tempStream => _tempStream.stream;

  Future<void> getTemperature() async{
    _tempStream.add(null);
    await Future.delayed(Duration(seconds: 2));
     Map<String,dynamic> response= await _weatherRepository.fetchCurrentTemp();
     WeatherModel weather=WeatherModel.fromJson(response);
     _tempStream.add(weather.main!.temp!);
  }
}

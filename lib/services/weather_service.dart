import 'package:dio/dio.dart';

class WeatherService{

  //a6592a4b7cb359a683dd69948408cd84
  //Latitude: -9,6660417
  // Longitude: -35,7352167
  Future<Map<String,dynamic>> fetchTemp() async{
    Response response =await Dio().get('https://api.openweathermap.org/data/2.5/weather?lat=-9.6660417&lon=-35.7352167&appid=a6592a4b7cb359a683dd69948408cd84');
    return response.data as Map<String,dynamic>;
  }
}
import 'package:weather_app/services/weather_service.dart';

class WeatherRepository {
  final WeatherService _service = WeatherService();

 Future<Map<String, dynamic>> fetchCurrentTemp() async {
    return  await _service.fetchTemp();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';

import '../providers/weather_provider.dart';

class SecondPageScreen extends StatefulWidget {
  const SecondPageScreen({Key? key}) : super(key: key);

  @override
  State<SecondPageScreen> createState() => _SecondPageScreenState();
}

class _SecondPageScreenState extends State<SecondPageScreen> {
  late final WeatherProvider _weatherProvider = context.read<WeatherProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(_weatherProvider.temp.toString(),style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('WeatherApp'),
      centerTitle: true,
    );
  }
}

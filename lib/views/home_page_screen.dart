import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late final WeatherProvider _weatherProvider = context.read<WeatherProvider>();
  double temp = 0;
  bool isLoading = false;
  final WeatherController _weatherController = WeatherController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('WeatherApp'),
      centerTitle: true,
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.refresh),
      onPressed: () async {
        if (isLoading) {
          return;
        }
        setState(() {
          isLoading = true;
        });
        await _weatherController.getTemperature();
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  _body() {
    return Container(
      child: Center(
        child: StreamBuilder<double?>(
            stream: _weatherController.tempStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _weatherProvider.setTemp(snapshot.data!);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data.toString(),
                    ),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/second"),
                        child: Icon(Icons.navigate_next))
                  ],
                );
              } else if (!snapshot.hasData) return CircularProgressIndicator();
              return Text("error");
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:liveweather/model/weather_model.dart';

class WeatherDetail extends StatelessWidget {
  WeatherModel weather;
  final city;
  // ignore: use_key_in_widget_constructors
  WeatherDetail(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32, top: 10),
      child: Column(
        children: <Widget>[
          Text(
            city,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            weather.getTemp.round().toString() + "C",
            style: TextStyle(color: Colors.white70, fontSize: 50),
          ),
          Text(
            'Temperature: ',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                Text(
                  weather.getMinTemp.round().toString() + "C",
                  style: TextStyle(color: Colors.white70, fontSize: 50),
                ),
                Text(
                  "Min Temperature",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                )
              ]),
              Column(children: <Widget>[
                Text(
                  weather.getMaxTemp.round().toString() + "C",
                  style: TextStyle(color: Colors.white70, fontSize: 50),
                ),
                Text(
                  "Max Temperature",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                )
              ]),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

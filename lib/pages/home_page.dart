import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveweather/bloc/weather_bloc.dart';
import 'package:liveweather/bloc/weather_state.dart';
import 'package:liveweather/pages/search_page.dart';
import 'package:liveweather/repository/weather_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(WeatherRepo()),
        child: BlocBuilder<WeatherBloc, WeatherState> (
          builder: (context, state) {
             // ignore: prefer_const_constructors
             return const SearchPage();
          }
          ),
        
      ),
    );
  }
}
import 'package:equatable/equatable.dart';


class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];


}

class FetchWeather extends WeatherEvent {
  final city;
  FetchWeather(this.city);

  @override
  List<Object> get props => [city];
}

class ResetWeather  extends WeatherEvent {

}


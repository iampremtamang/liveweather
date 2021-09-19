import 'package:bloc/bloc.dart';
import 'package:liveweather/bloc/weather_event.dart';
import 'package:liveweather/bloc/weather_state.dart';
import 'package:liveweather/model/weather_model.dart';
import 'package:liveweather/repository/weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  
  WeatherRepo  weatherRepo;
  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched);

  @override
  WeatherState  get initialState => WeatherIsNotSearched();

  get event => null;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    
    if(event is FetchWeather) {
      yield WeatherIsLoading();

      try {
        // ignore: unused_local_variable
        WeatherModel weather = await weatherRepo.getWeather(event._city);
        yield WeatherIsLoaded(weather);
        
      } catch(_) {
        yield WeatherIsNotSearched();
      }
    }
  }
}
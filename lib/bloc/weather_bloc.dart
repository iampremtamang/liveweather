import 'package:bloc/bloc.dart';
import 'package:liveweather/bloc/weather_event.dart';
import 'package:liveweather/bloc/weather_state.dart';
import 'package:liveweather/model/weather_model.dart';
import 'package:liveweather/repository/weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  
  WeatherRepo  weatherRepo;
  WeatherBloc(this.weatherRepo):super(WeatherIsNotSearched());
  
  @override
  // ignore: override_on_non_overriding_member
  WeatherState  get initialState => WeatherIsNotSearched();


  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    
    if(event is FetchWeather) {
      yield WeatherIsLoading();

      try {
        // ignore: unused_local_variable
        WeatherModel? weather = await weatherRepo.getWeather(event.city);
        yield WeatherIsLoaded(weather);
        
      } catch(_) {
        yield WeatherIsNotSearched();
      }
    }else if(event is ResetWeather) {
      yield WeatherIsNotSearched();
    }
  }
}
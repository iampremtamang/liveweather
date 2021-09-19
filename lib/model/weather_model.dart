class WeatherModel {
  final temp;
  final pressure;
  final humidity;
  final temp_max;
  final temp_min;

  double get getTemp =>temp;
  double get getMaxTemp=> temp_max;
  double get getMinTemp => temp_min;

  WeatherModel(this.temp, this.pressure, this.humidity, this.temp_max, this.temp_min);


  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      json["temp"],
      json["pressure"],
      json["humidity"],
      json["temp_max"],
      json["temp_min"]
    );
  }
}
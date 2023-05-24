class WeatherModel {
  String name;
  String region;
  String country;
  String tz_id;
  String localtime;
  double temp_c;
  double temp_f;
  String time;
  double temp;
  String text;
  double feelslike_c;
  int humidity;
  double wind_kph;
  double uv;
  double vis_km;
  double pressure_mb;
  List hour;

  WeatherModel({
    required this.name,
    required this.region,
    required this.country,
    required this.tz_id,
    required this.localtime,
    required this.temp_c,
    required this.temp_f,
    required this.time,
    required this.temp,
    required this.text,
    required this.feelslike_c,
    required this.humidity,
    required this.wind_kph,
    required this.uv,
    required this.vis_km,
    required this.pressure_mb,
    required this.hour,
  });

  factory WeatherModel.frommap({required Map data}) {
    return WeatherModel(
      name: data['location']['name'],
      region: data['location']['region'],
      country: data['location']['country'],
      tz_id: data['location']['tz_id'],
      localtime: data['current']['last_updated'],
      temp_c: data['current']['temp_c'],
      temp_f: data['current']['temp_f'],
      hour: data['forecast']['forecastday'][i]['hour'],
      time: data['forecast']['forecastday'][i]['hour'][i]['time'],
      temp: data['forecast']['forecastday'][i]['hour'][i]['temp_c'],
      text: data['forecast']['forecastday'][i]['hour'][i]['condition']['text'],
      feelslike_c: data['forecast']['forecastday'][i]['hour'][i]['feelslike_c'],
      humidity: data['forecast']['forecastday'][i]['hour'][i]['humidity'],
      wind_kph: data['forecast']['forecastday'][i]['hour'][i]['wind_kph'],
      uv: data['forecast']['forecastday'][i]['hour'][i]['uv'],
      vis_km: data['forecast']['forecastday'][i]['hour'][i]['vis_km'],
      pressure_mb: data['forecast']['forecastday'][i]['hour'][i]['pressure_mb'],
    );
  }
}

int i = 0;
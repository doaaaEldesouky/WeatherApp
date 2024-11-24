import 'package:weather/models/Weather_model.dart';

class InitialState extends WeatherState
{

}
class WeatherLoadedState extends WeatherState
{
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}
class WeatherFailureState extends WeatherState
{
  final String errMes;

  WeatherFailureState(this.errMes);
}

class WeatherState {

}
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeatherCubit/get_weather_state.dart';
import 'package:weather/models/Weather_model.dart';
import 'package:weather/wedgits/NoWeatherBody.dart';

import '../../services/WeatherServices.dart';

class GetWeatherCubit extends Cubit<WeatherState>
{
  GetWeatherCubit():super(InitialState());
   WeatherModel? weatherModel;

  Future<void>getWeather({required String cityname})
  async {

    try {
      weatherModel=await WeatherService(Dio()).getCurrentWeather(cityName: cityname);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }

}


import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/Weather_model.dart';

class WeatherService
{
   final Dio dio;
   final String baseURL='https://api.weatherapi.com/v1';
   final String apiKey='bdf2ccac3d424b06a1172708240711';

  WeatherService(this.dio);
   Future <WeatherModel> getCurrentWeather({required String cityName})async
   {

        try {
                Response response =await dio.get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');

                WeatherModel weatherModel= WeatherModel.fromJson(response.data);
                print(response.data);
                return weatherModel;
        } on DioException catch (e) {
           final String errorMes=e.response?.data['error']['message']??'oops there was an error,try later .';
           throw Exception(errorMes);
        }catch (e)
       {
          log(e.toString());
          throw Exception('oops there was an error ');

       }


        // return weatherModel;
        //

   }

}
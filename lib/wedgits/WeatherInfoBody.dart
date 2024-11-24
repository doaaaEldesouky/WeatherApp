
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather/models/Weather_model.dart';

class WeatherInfoBody extends StatelessWidget
{
  const WeatherInfoBody({super.key, required this.weather,});

  @override
  final WeatherModel  weather;
  Widget build(BuildContext context) {
   WeatherModel weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
   return Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(
           begin:Alignment.topCenter ,
           end: Alignment.bottomCenter,
          colors: [
            getWeatherMaterialColor(weatherModel.weatherCondition),
            getWeatherMaterialColor(weatherModel.weatherCondition)[300]!,
            getWeatherMaterialColor(weatherModel.weatherCondition)[50]!

          ],
       ),
     ),
     child: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(weatherModel.CityName,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 28  ),),
           Text('Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}:${weatherModel.date.second}',style: TextStyle(fontSize: 24  ),)
           ,SizedBox(height: 32,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Image.network("https:${weatherModel.image!}"),
               Text(weatherModel.temp.round().toString(),style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
               Column(
                 children: [
                   Text("MaxTemp:${weatherModel.maxTemp.round()}"),
                   Text("MinTemp: ${weatherModel.minTemp.round()}"),

                 ],
               )
             ],
           ),
           Text(weatherModel.weatherCondition,style: TextStyle(fontSize: 28),)
         ],

       ),
     ),
   );
  }

}

DateTime stringToDate(String value)
{
    return DateTime.parse(value);
}
MaterialColor getWeatherMaterialColor(String? condition) {
  if (condition == null) {
    return Colors.blue; // لون افتراضي
  }
  switch (condition.toLowerCase()) { // تحويل النصوص إلى أحرف صغيرة
    case 'sunny':
      return Colors.orange;
    case 'clear':
      return Colors.indigo;
    case 'partly cloudy':
      return Colors.blue;
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
      return Colors.blueGrey;
    default:
      return Colors.blue; // لون افتراضي إذا لم يتم التعرف على الحالة
  }
}
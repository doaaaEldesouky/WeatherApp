import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather/cubits/getWeatherCubit/get_weather_state.dart';
import 'package:weather/models/Weather_model.dart';

import 'package:weather/pages/SearchView.dart';
import 'package:weather/wedgits/WeatherInfoBody.dart';
import '../models/Weather_model.dart';
import '../wedgits/NoWeatherBody.dart';


class HomePage extends StatelessWidget
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
      Theme.of(context).primaryColor,
        title: Text('Weather App',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)
            {
               return SearchView();
            }));
          }, icon: Icon(Icons.search,color: Colors.white,))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if(state is InitialState)
            {
              return NoWeatherBody();
            }else if(state is WeatherLoadedState)
              {
                print("Current Weather Condition: ${state.weatherModel?.weatherCondition}");

                return WeatherInfoBody(weather: state.weatherModel,);
              }else
                {
                  return Text('oops There was an error');
                }
        },
      ),
    );
  }

}


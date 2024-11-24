
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather/models/Weather_model.dart';
import 'package:weather/services/WeatherServices.dart';

class SearchView extends StatelessWidget
{
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:
      Theme.of(context).primaryColor,
        title: Text('Search City',style:TextStyle(color: Colors.white),),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            // onChanged: (value)
            // {
            //     log(value);
            // },
            onSubmitted: (value)async
            {
              var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityname: value);

            // Navigator.of(context).pop();
               Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal:16 ,
                vertical: 32
              ),
              labelText: 'Search',
            suffixIcon: Icon(Icons.search),
              // suffixIconColor: Colors.red,
              hintText: 'Enter City Name',
              hintStyle: TextStyle(fontSize: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green)
                  ,
              ),
            //   enabledBorder: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.green),
            //       borderRadius: BorderRadius.circular(16),
            //
            // )

            ),
          ),
        ),
      ),
    );
  }

}

WeatherModel? weatherModel;
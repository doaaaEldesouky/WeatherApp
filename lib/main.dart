import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather/cubits/getWeatherCubit/get_weather_state.dart';
import 'package:weather/pages/SearchView.dart';
import 'package:weather/pages/homePage.dart';

void main() {
  runApp(const MyApp()); // شغل MyApp كـ widget رئيسي هنا
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) =>
           BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {

              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getWeatherMaterialColor(  BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition),

                ),
                home: const HomePage(),
              );
            }

            ,
      )

        ,
      ),
    );
  }
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

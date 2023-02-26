import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbook/services/data_services.dart';
import 'package:hotelbook/services/search_data_service.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_cubit_logic.dart';


void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<AppCubits>(
          create: (context) =>
              AppCubits(data: DataServices(), searchdata: SearchDataServices()),
          child: AppCubitLogics(),
        ));
  }
}

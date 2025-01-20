import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodcart/repository/DioRepository.dart';
import 'package:foodcart/screens/SplashScreen.dart';
import 'package:foodcart/viewmodels/AuthViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  // Initialize Dio instance
  final dio = Dio();
  final dioRepository = DioRepository(dio);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(dioRepository),
        ),
      ],
      child: MaterialApp(
        title: 'MVVM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashScreen(),
      ),
    ),
  );
}

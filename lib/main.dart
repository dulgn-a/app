import 'package:flutter/material.dart';
import './lab1/tasbeeh.dart';
import './lab2/login.dart';
import './lab2/signUp.dart';
import 'home.dart';
import 'yvts/moneyConverterHome.dart';
// import 'yvts/moneyConverter.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.black),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/tasbeeh': (context) => const CounterApp(),
        '/history': (context) => const HistoryList(),
        '/login': (context) => const Login(),
        '/signUp': (context) => const SignUp(),
        '/moneyConverterHome': (context) => MoneyConverterHome(),
      },
    ),
  );
}

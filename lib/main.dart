import 'package:flutter/material.dart';
import 'package:flutter_recipe01/holder/main_page.dart';
import 'theme.dart';


void main() {
  runApp(CarrotMarketUI());
}

class CarrotMarketUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'carrot_market_ui',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: theme(),
    );
  }
}
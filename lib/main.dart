import 'package:flutter/material.dart';
import 'package:page/cal.dart';
import 'package:page/calcul1.dart';

import 'package:page/calculus.dart';
import 'package:page/saks/bmi.dart';


void main() {
  runApp(abc());
}
class abc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}
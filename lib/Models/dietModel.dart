import 'package:flutter/material.dart';

class Dietmodel {

  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewButton;
  Color boxColor;

  Dietmodel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewButton,
    required this.boxColor
  });

  static List <Dietmodel> getDiets() {

    List <Dietmodel> diets = [];

    diets.add(
      Dietmodel(
        name: 'Natural Foods', 
        iconPath: 'assets/diet.png', 
        level: 'Easy', 
        duration: '30mins', 
        calorie: '180kCal', 
        viewButton: true,
        boxColor: const Color(0xff92A3FD),
      )
    );

    diets.add(
      Dietmodel(
        name: 'Daily Eat', 
        iconPath: 'assets/organic-food.png', 
        level: 'Medium', 
        duration: '45mins', 
        calorie: '140kCal', 
        viewButton: false,
        boxColor: const Color(0xffC58BF2),
      )
    );

    diets.add(
      Dietmodel(
        name: 'Drink Water', 
        iconPath: 'assets/soda.png', 
        level: 'Easy', 
        duration: '15days', 
        calorie: '10kCal', 
        viewButton: true,
        boxColor: const Color(0xffC58BF2),
      )
    );

    return diets;
  }

}
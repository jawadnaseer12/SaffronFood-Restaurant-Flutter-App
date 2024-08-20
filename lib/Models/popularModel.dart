import 'package:flutter/material.dart';

class popularmodel {

  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewButton;
  Color boxColor;

  popularmodel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewButton,
    required this.boxColor
  });

  static List <popularmodel> getPopulars() {

    List <popularmodel> populars = [];

    populars.add(
      popularmodel(
        name: 'Hot & Spicy', 
        iconPath: 'assets/cooking.png', 
        level: 'Spicy', 
        duration: '1.5hours', 
        calorie: '280kCal', 
        viewButton: true,
        boxColor: const Color(0xff92A3FD),
      )
    );

    populars.add(
      popularmodel(
        name: 'Spicy Shawarma', 
        iconPath: 'assets/taco.png', 
        level: 'Spicy', 
        duration: '30mins', 
        calorie: '250kCal', 
        viewButton: false,
        boxColor: const Color(0xffC58BF2),
      )
    );

    populars.add(
      popularmodel(
        name: 'One Piece Deal', 
        iconPath: 'assets/pizza.png', 
        level: 'Light', 
        duration: '1hours', 
        calorie: '190kCal', 
        viewButton: false,
        boxColor: const Color(0xff92A3FD),
      )
    );

    return populars;
  }

}
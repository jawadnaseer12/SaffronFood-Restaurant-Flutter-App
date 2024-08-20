import 'package:flutter/material.dart';

class Productcategory {

  String name;
  String iconPath;
  Color boxColor;

  Productcategory({
    required this.name,
    required this.iconPath,
    required this.boxColor
  });

  static List<Productcategory> getCategory() {

    List<Productcategory> categories = [];

    categories.add(
      Productcategory(
        name: 'Pizza', 
        iconPath: 'assets/pizza.png', 
        boxColor: const Color(0xff92A3FD),
      )
    );

    categories.add(
      Productcategory(
        name: 'Handi', 
        iconPath: 'assets/cooking.png', 
        boxColor: const Color(0xffC58BF2),
      )
    );

    categories.add(
      Productcategory(
        name: 'Burger', 
        iconPath: 'assets/hamburger.png', 
        boxColor: const Color(0xff92A3FD),
      )
    );

    categories.add(
      Productcategory(
        name: 'Diet', 
        iconPath: 'assets/diet.png', 
        boxColor: const Color(0xffC58BF2),
      )
    );

    categories.add(
      Productcategory(
        name: 'Taco', 
        iconPath: 'assets/taco.png', 
        boxColor: Color(0xff92A3FD),
      )
    );

    categories.add(
      Productcategory(
        name: 'Cold Drink', 
        iconPath: 'assets/soda.png', 
        boxColor: Color(0xffC58BF2),
      )
    );

    categories.add(
      Productcategory(
        name: 'Deals', 
        iconPath: 'assets/fast-food.png', 
        boxColor: Color(0xff92A3FD),
      )
    );

    return categories;
  }

}
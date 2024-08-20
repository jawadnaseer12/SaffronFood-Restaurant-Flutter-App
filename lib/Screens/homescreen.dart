import 'package:basicpractice/Models/dietModel.dart';
import 'package:basicpractice/Models/popularModel.dart';
import 'package:basicpractice/Models/productcategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  
  List<Productcategory> categories = []; 
  List<Dietmodel> diets = [];
  List<popularmodel> popularFood = [];

  void _getCategories() {
    categories = Productcategory.getCategory();
  }

  void _getDiets() {
    diets = Dietmodel.getDiets();
  }

  void _getPopulars() {
    popularFood = popularmodel.getPopulars();
  }

  @override
  void initState() {
    _getCategories();
    _getDiets();
    _getPopulars();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDiets();
    _getPopulars();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          _searchField(),
          const SizedBox(height: 40),
          _productCategory(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popularFoodSection(),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }

  Column _popularFoodSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Popular Food',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              itemCount: popularFood.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 115,
                  decoration: BoxDecoration(
                    color: popularFood[index].viewButton ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: popularFood[index].viewButton ? [
                      BoxShadow(
                        color: const Color(0xff1D1617).withOpacity(0.07),
                        offset: const Offset(0, 20),
                        blurRadius: 40,
                        spreadRadius: 0,
                      )
                    ] : []
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(image: AssetImage(popularFood[index].iconPath), height: 70, width: 70),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularFood[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            popularFood[index].level + ' | ' + popularFood[index].duration + ' | ' + popularFood[index].calorie,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff786F72),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Image(image: AssetImage('assets/right-arrow.png'), height: 30, width: 30)
                      ),
                    ],
                  ),
                );
              }
            ),
        ]);
  }

  Column _dietSection() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
          
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: Colors.transparent,
          height: 200,
          child: ListView.separated( 
            separatorBuilder: (context, index) => const SizedBox(width: 25), 
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage(diets[index].iconPath), height: 70, width: 70,),
                    Column(
                      children: [
                      Text(
                        diets[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xff786F72),
                          fontSize: 13,
                        ),
                      ),
                    ]),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diets[index].viewButton ? const Color(0xff9DCEFF) : Colors.transparent,
                            diets[index].viewButton ? const Color(0xff92A3FD) : Colors.transparent
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: diets[index].viewButton ? Colors.white : const Color(0xffC58BF2),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                ]),
              );
            },
          ),
        ),
      ]);
  }

  Column _productCategory() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            color: Colors.transparent,
            child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return Container(
                  // height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image(image: AssetImage(categories[index].iconPath)),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],),
                );
              }
            ),
          ),
        ],
      );
  }

  Container _searchField() {
    return Container(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
           BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
           )
          ]
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Burger',
            hintStyle: const TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14,
            ),
            prefixIcon: const Padding(
              padding:  EdgeInsets.all(12),
              child: Image(
                image: AssetImage('search-interface-symbol.png'),
                height: 20,
                width: 20,
              ),
            ),
            suffixIcon: Container(
              width: 70,
              child: const IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(12),
                      child: Image(
                        image: AssetImage('settings-sliders.png'),
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // prefixIcon: Icon(Icons.search, color: Colors.black.withOpacity(0.20)),
            // suffixIcon: Icon(Icons.filter_alt, color: Colors.black.withOpacity(0.20)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Saffron",
        style: TextStyle(
          color: Colors.red,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),  
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xff92A3FD).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.navigate_before, color: Colors.black),
        ),
      ),
      actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 37,
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xff92A3FD).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.more_horiz, color: Colors.black),
                      ),
          ),
      ],
    );
  }
}

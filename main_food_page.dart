import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimentions.height45, bottom: Dimentions.height15),
              padding: EdgeInsets.only(left: Dimentions.width20, right: Dimentions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Hindustan", color: Colors.red, size:20,),
                      Row(
                        children: [
                          SmallText(text: "Abohar", color: Colors.black54),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimentions.height45,
                      height: Dimentions.height45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimentions.iconsize24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimentions.radius15),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child:  FoodPageBody(),
          ))
        ],
      ),
    );
  }
}

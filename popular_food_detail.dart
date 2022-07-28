import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimentions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food1.png"),
                  )
                ),
              ),
          ),
          Positioned(
            top: Dimentions.height45,
              left: Dimentions.width20,
              right: Dimentions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios_new),
                  AppIcon(icon: Icons.shopping_cart_outlined),

                ],
              ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimentions.popularFoodImgSize-30,
            child: Container(
              padding: EdgeInsets.only(left: Dimentions.width20, right: Dimentions.width20,top: Dimentions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimentions.radius20),
                  topLeft: Radius.circular(Dimentions.radius20),

                  
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Indian food",),
                  SizedBox(height: Dimentions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimentions.height20,),

                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Pizza is one of the most sought-after dishes of Italian cuisine and is one of the easy dishes that you can prepare at home for your loved ones. The only setback is - making the perfect pizza base. Not everyone can make it. However, in this easy recipe, we give you step-by-step details on how to make a pizza using the fresh pizza base. Though you can buy a pizza base from the nearest superstore or market, the real taste of a pizza will only come when you make a fresh pizza. Also, another thing about pizza making is that you need to bake it at the right temperature and under the right conditions. So, if you are all set to make the pizza at home, here is an easy recipe that will guide you to prepare that perfect pizza. All you need to prepare the simplest Pizza at home is all-purpose flour, dry yeast, warm water, onion, tomato, capsicum, and different kinds of cheese along with tomato ketchup. Here, in this Italian recipe, we have used mushrooms as well, which is a subjective choice. You can also add any other vegetable of your liking to the pizza. This dish is one of the most versatile dishes, in which you can use any of your favourite veggies. This cheesy delight can be served on occasions like kitty party, potluck and even game night. If you have a party planned at home, then it's the easiest dish to prepare. Before serving, sprinkle some oregano and red chillies over the pizza and enjoy with tomato ketchup."))),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimentions.bottomHeightBar,
          padding: EdgeInsets.only(top:Dimentions.height20, bottom: Dimentions.height20, left: Dimentions.width20,right: Dimentions.width20),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimentions.radius20*1.5),
            topRight: Radius.circular(Dimentions.radius20*1.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: Dimentions.width20,right: Dimentions.width20,top: Dimentions.height10,bottom: Dimentions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [

                  Icon(Icons.remove, color: Colors.black54,),
                  SizedBox(width: Dimentions.width10,),
                  BigText(text: "0"),
                  SizedBox(width: Dimentions.width10,),
                  Icon(Icons.add, color: Colors.black54,),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: Dimentions.width20,right: Dimentions.width20,top: Dimentions.height10,bottom: Dimentions.height10),

              child: BigText(text: "Rs 500 | Add to cart",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

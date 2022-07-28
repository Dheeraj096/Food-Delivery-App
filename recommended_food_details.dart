import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
          ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                // margin: EdgeInsets.only(left: 20),

                child: Center(child: BigText(size:Dimentions.font26,text: "Indian Food",)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.radius20),
                    topRight: Radius.circular(Dimentions.radius20),
                  )
                ),

              ),
            ),
            pinned: true,
            backgroundColor: Colors.greenAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food8.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text:
                    "Pizza is one of the most sought-after dishes of Italian cuisine and is one of the easy dishes that you can prepare at home for your loved ones. The only setback is - making the perfect pizza base. Not everyone can make it. However, in this easy recipe, we give you step-by-step details on how to make a pizza using the fresh pizza base. Though you can buy a pizza base from the nearest superstore or market, the real taste of a pizza will only come when you make a fresh pizza. Also, another thing about pizza making is that you need to bake it at the right temperature and under the right conditions. So, if you are all set to make the pizza at home, here is an easy recipe that will guide you to prepare that perfect pizza. All you need to prepare the simplest Pizza at home is all-purpose flour, dry yeast, warm water, onion, tomato, capsicum, and different kinds of cheese along with tomato ketchup. Here, in this Italian recipe, we have used mushrooms as well, which is a subjective choice. You can also add any other vegetable of your liking to the pizza. This dish is one of the most versatile dishes, in which you can use any of your favourite veggies. This cheesy delight can be served on occasions like kitty party, potluck and even game night. If you have a party planned at home, then it's the easiest dish to prepare. Before serving, sprinkle some oregano and red chillies over the pizza and enjoy with tomato ketchup. Pizza is one of the most sought-after dishes of Italian cuisine and is one of the easy dishes that you can prepare at home for your loved ones. The only setback is - making the perfect pizza base. Not everyone can make it. However, in this easy recipe, we give you step-by-step details on how to make a pizza using the fresh pizza base. Though you can buy a pizza base from the nearest superstore or market, the real taste of a pizza will only come when you make a fresh pizza. Also, another thing about pizza making is that you need to bake it at the right temperature and under the right conditions. So, if you are all set to make the pizza at home, here is an easy recipe that will guide you to prepare that perfect pizza. All you need to prepare the simplest Pizza at home is all-purpose flour, dry yeast, warm water, onion, tomato, capsicum, and different kinds of cheese along with tomato ketchup. Here, in this Italian recipe, we have used mushrooms as well, which is a subjective choice. You can also add any other vegetable of your liking to the pizza. This dish is one of the most versatile dishes, in which you can use any of your favourite veggies. This cheesy delight can be served on occasions like kitty party, potluck and even game night. If you have a party planned at home, then it's the easiest dish to prepare. Before serving, sprinkle some oregano and red chillies over the pizza and enjoy with tomato ketchup",
                  ),
                  margin: EdgeInsets.only(left: Dimentions.width20, right: Dimentions.width20),
                ),

              ],
            )
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.remove),
              AppIcon(icon: Icons.add),
            ],
          )
        ],
      ),
    );
  }
}

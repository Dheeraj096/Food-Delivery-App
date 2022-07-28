import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  var _currPagrValue=0.0;
  double _scaleFactor=0.8;
  double _height = Dimentions.pageViewContainer;
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPagrValue=pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        //slider
        Container(
      //color: Colors.red,
      height: Dimentions.pageView,
      child: PageView.builder(
        controller: pageController,

        itemCount: 5,
        itemBuilder: (context,position) {
          return _buildPageItem(position);
        },
      ),


    ),
       //dot
      new DotsIndicator(
    dotsCount: 5,
    position: _currPagrValue,
    decorator: DotsDecorator(
    activeColor: Colors.redAccent,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        //popular
        SizedBox(height: Dimentions.height30,),

        Container(
          margin: EdgeInsets.only(left: Dimentions.width30 ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular", size: 0),
              SizedBox(width: Dimentions.width20,),
              Container(
                margin: const EdgeInsets.only(bottom: 3.0),
                child: BigText(text: ".", color: Colors.black26, size: 0,),
              ),
              SizedBox(width: Dimentions.width20,),
              Container(
                margin: const EdgeInsets.only(bottom: 2.0),

                child: SmallText(text: "Food Paring",),
              ),
            ],
          ),
        ),
        //list of food and images
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context , index){
                return Container(
                  margin: EdgeInsets.only(left: Dimentions.width20, right: Dimentions.width20, bottom: Dimentions.height10),
                  child: Row(
                    children: [
                      //image section
                      Container(
                        height: Dimentions.listViewImgSize,
                        width: Dimentions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimentions.radius20),
                          color: Colors.white38,

                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/food6.png"),
                          ),
                        ),
                      ),
                      //text container
                      Expanded(
                        child: Container(
                          height: Dimentions.listViewTextContainer,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimentions.radius20),
                              bottomRight: Radius.circular(Dimentions.radius20),

                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimentions.width10,right: Dimentions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Nutritius food in India "),
                                SizedBox(height: Dimentions.height10,),
                                SmallText(text: "With some spicy flavours"),
                                SizedBox(height: Dimentions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(icon: Icons.blur_circular_sharp,
                                        text: "Normal",
                                        iconColor: Colors.orangeAccent
                                    ),
                                    IconAndTextWidget(icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: Colors.redAccent,
                                    ),

                                    IconAndTextWidget(icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: Colors.brown,
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),

      ],
    );
  }

  Widget _buildPageItem(int index)
  {
    Matrix4 matrix4 = new Matrix4.identity();
    if(index==_currPagrValue.floor())
      {
        var currScale=1-(_currPagrValue-index)*(1-_scaleFactor);
        var currTrans=(_height)*(1-currScale)/2;
        matrix4=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      }
    else if(index==_currPagrValue.floor()+1)
      {
        var currScale = _scaleFactor+(_currPagrValue-index+1)*(1-_scaleFactor);
        var currTrans=(_height)*(1-currScale)/2;
        matrix4=Matrix4.diagonal3Values(1, currScale, 1);
        matrix4=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      }
    else if(index==_currPagrValue.floor()-1)
    {
      var currScale=1-(_currPagrValue-index)*(1-_scaleFactor);
      var currTrans=(_height)*(1-currScale)/2;

      matrix4=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else
      {
        var currScale=0.8;
        var currTrans=(_height)*(1-currScale)/2;

        matrix4=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

      }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: Dimentions.width10, right: Dimentions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimentions.radius30),
              color: index.isEven? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/image/food1.png"
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimentions.width30, right: Dimentions.width30,bottom: Dimentions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5,0),
                  ),
                ]
            ),
              child: Container(
                padding: EdgeInsets.only(top: Dimentions.height15, left: 15, right: 15),
                child: AppColumn(text: "Indian food",),
              ),
          ),
          ),
        ],
      ),
    );
  }

}

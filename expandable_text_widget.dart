import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;
  double TextHeight=Dimentions.screenHeight/3.78;

  @override
  void initState(){
    super.initState();
    if(widget.text.length > TextHeight){
      firstHalf= widget.text.substring(0,TextHeight.toInt());
      secondHalf=widget.text.substring(TextHeight.toInt()+1,widget.text.length );
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: Colors.black26,size: Dimentions.font16,text: firstHalf):Column(
        children: [
          SmallText(height:1.2,color: Colors.black54,size: Dimentions.font16,text: hiddenText?(firstHalf+"..."):firstHalf+secondHalf),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });

            },
            child: Row(
              children: [
                SmallText(text: hiddenText?"Show more":"Show less", color: Colors.red,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Colors.red,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

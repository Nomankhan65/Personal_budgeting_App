import 'package:flutter/cupertino.dart';

class MyText extends StatelessWidget {
  var text;
  double? fontSize;
  Color? color;
  double? spacing;
  MyText({super.key,this.text,this.fontSize=16,this.color,this.spacing,});

  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(
      fontSize:fontSize,
      color:color,
      letterSpacing:spacing,
      fontFamily:'sans',
    ),);
  }
}
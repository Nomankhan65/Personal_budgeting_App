import 'package:flutter/material.dart';
import 'package:personal_budgeting_app/components/colors.dart';

import 'my_text.dart';
class MyButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onTap;
  final double horizentalPadding;
  final  double verticalPadding;

  MyButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isLoading=false,
    this.horizentalPadding=28,
    this.verticalPadding=0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal:horizentalPadding,vertical:verticalPadding),
      child: SizedBox(
        height: 40,
        width:double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation:isLoading?null:0,
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(50),
            ),
            backgroundColor:primaryColor,
          ),
          onPressed:onTap,
          child: isLoading
              ? const SizedBox(height:28,width:28,child: CircularProgressIndicator(color: Colors.white,strokeWidth:2.5,))
              : MyText(
            color:titleColor.withOpacity(0.6),
            text:title, fontSize: 17,spacing:1,),
        ),
      ),
    );
  }
}

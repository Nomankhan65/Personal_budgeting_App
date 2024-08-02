import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_budgeting_app/components/colors.dart';
import 'package:personal_budgeting_app/components/my_button.dart';
import 'package:personal_budgeting_app/components/my_text.dart';
import 'package:personal_budgeting_app/components/my_textField.dart';

class UploadScreen extends StatelessWidget {

  final categoryController=TextEditingController();
  final totalAmountController=TextEditingController();
  final totalSpentController=TextEditingController();
    UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme:IconThemeData(
          color:titleColor
        ),
        title:MyText(text:'Add new category',fontSize:20,color:titleColor,),
      ),
      body: Column(children: [
        MyTextField(controller: categoryController, label:'Category', hintText:'Enter category name'),
        MyTextField(controller: totalAmountController, label:'Total Amount', hintText:'Enter total amount'),
        MyTextField(controller: totalSpentController, label:'Spent Amount', hintText:'Enter spent amount'),
        MyButton(title:'Save', onTap: (){},)
      ],),
    );
  }
}

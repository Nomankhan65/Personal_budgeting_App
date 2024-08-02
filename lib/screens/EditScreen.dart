import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/colors.dart';
import '../components/my_button.dart';
import '../components/my_text.dart';
import '../components/my_textField.dart';

class EditScreen extends StatelessWidget {
  final categoryController=TextEditingController();
  final totalAmountController=TextEditingController();
  final totalSpentController=TextEditingController();
  EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme:IconThemeData(
            color:titleColor
        ),
        title:MyText(text:'Update category',fontSize:20,color:titleColor,),
      ),
      body: Column(children: [
        MyTextField(controller: categoryController, label:'Category', hintText:'Enter category name'),
        MyTextField(controller: totalAmountController, label:'Total Amount', hintText:'Enter total amount'),
        MyTextField(controller: totalSpentController, label:'Spent Amount', hintText:'Enter spent amount'),
        MyButton(title:'Update', onTap: (){},)
      ],),
    );
  }
}

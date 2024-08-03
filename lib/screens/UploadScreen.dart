import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:personal_budgeting_app/components/colors.dart';
import 'package:personal_budgeting_app/components/my_button.dart';
import 'package:personal_budgeting_app/components/my_text.dart';
import 'package:personal_budgeting_app/components/my_textField.dart';

class UploadScreen extends StatefulWidget {


  UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final categoryController=TextEditingController();
  final totalAmountController=TextEditingController();
  final totalSpentController=TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool loading=false;
  @override
  void dispose() {
    categoryController.dispose();
    totalAmountController.dispose();
    totalSpentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme:IconThemeData(
          color:titleColor
        ),
        title:MyText(text:'Add new category',fontSize:20,color:titleColor,),
      ),
      body: Form(
        key:formKey,
        child: Column(children: [
          const SizedBox(height:50,),
          MyTextField(controller: categoryController, label:'Category', hintText:'Enter category name'),
          MyTextField(controller: totalAmountController, label:'Total amount', hintText:'Enter total amount',type:TextInputType.number,),
          MyTextField(controller: totalSpentController, label:'Spent amount', hintText:'Enter spent amount',type:TextInputType.number,),
          MyButton(
            title: 'Save',
            isLoading: loading,
            onTap: () async{
              var id = DateTime.now().millisecondsSinceEpoch;
              if (formKey.currentState!.validate()) {
                try{
                  setState(() {
                    loading=true;
                  });
                  await  FirebaseFirestore.instance
                      .collection('BudgetCategories')
                      .doc('$id')
                      .set({
                    'id': id,
                    'category': categoryController.text,
                    'totalAmount':int.parse(totalAmountController.text),
                    'spentAmount':int.parse(totalSpentController.text),
                  });
                }catch(e){
                  setState(() {
                    loading=false;
                  });
                  Fluttertoast.showToast(msg:e.toString());
                }finally{
                  setState(() {
                    loading=false;
                  });
                  Fluttertoast.showToast(msg: 'Category saved!');
                  totalSpentController.text='';
                  totalAmountController.text='';
                  categoryController.text='';
                }}},
          )
        ],),
      ),
    );
  }}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/colors.dart';
import '../components/my_button.dart';
import '../components/my_text.dart';
import '../components/my_textField.dart';

class EditScreen extends StatefulWidget {
  int id;
  String category;
  int totalAmount;
  int spentAmount;
  EditScreen({super.key,
    required this.id,
     required this.category,
     required this.totalAmount,
     required  this.spentAmount,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.text=widget.category;
    totalAmountController.text=widget.totalAmount.toString();
    totalSpentController.text=widget.spentAmount.toString();
  }
  final categoryController=TextEditingController();
  final totalAmountController=TextEditingController();
  final totalSpentController=TextEditingController();
  bool loading=false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme:IconThemeData(
            color:titleColor
        ),
        title:MyText(text:'Update category',fontSize:20,color:titleColor,),
      ),
      body: Form(
        key:formKey,
        child: Column(children: [
          const SizedBox(height:50,),
          MyTextField(controller: categoryController, label:'Category', hintText:'Enter category name'),
          MyTextField(controller: totalAmountController, label:'Total Amount', hintText:'Enter total amount',type:TextInputType.number,),
          MyTextField(controller: totalSpentController, label:'Spent Amount', hintText:'Enter spent amount',type:TextInputType.number,),
          MyButton(title:'Update', onTap: (){

            if(formKey.currentState!.validate()){
              showDialog(
                  context: context,
                  builder: (
                      context,
                      )
                  {
                    return AlertDialog(
                      title: MyText(text: 'Do you want to update category!',color:titleColor.withOpacity(0.7),),
                      content:Column(
                        mainAxisSize:MainAxisSize.min,
                        children: [
                          MyButton(title: 'Yes',isLoading:loading,verticalPadding:10, onTap: ()async{
                              try{
                                setState(() {
                                  loading=true;
                                });
                                await  FirebaseFirestore.instance
                                    .collection('BudgetCategories')
                                    .doc('${widget.id}')
                                    .update({
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
                                Fluttertoast.showToast(msg: 'Category Updated!');
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                          }),
                          SizedBox(
                              width:double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:28,vertical:10),
                                child: OutlinedButton(

                                    style:OutlinedButton.styleFrom(
                                        side:BorderSide(
                                            color:primaryColor
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }, child:MyText(text:'No',color:primaryColor,)),
                              ))
                        ],),

                    );
                  }
              );
            }

          }
          )
        ],),
      ),
    );
  }
}

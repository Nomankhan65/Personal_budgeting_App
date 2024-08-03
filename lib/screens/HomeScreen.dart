import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_budgeting_app/components/colors.dart';
import 'package:personal_budgeting_app/screens/UploadScreen.dart';

import '../components/my_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<Color>> colorPairs = [
    [const Color(0xffFE9542),const Color(0xffFEB57F)],
    [const Color(0xff4AAABF),const Color(0xff97E5F7)],
    [const Color(0xffE27370),const Color(0xffFE9B98)],
    [const Color(0xffA77AE1),const Color(0xffCFACFE)],
    [const Color(0xffF18074),const Color(0xffFFB506)],
    [Colors.deepOrangeAccent, Colors.deepOrangeAccent.shade100],
    [Colors.blue, Colors.lightBlueAccent.shade100],
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration:BoxDecoration(
        gradient: LinearGradient(
              colors: [
                primaryColor,
                Colors.white
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        floatingActionButton:FloatingActionButton(
            backgroundColor:primaryColor,
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> UploadScreen()));
            },
        child:Icon(Icons.add,color:titleColor.withOpacity(0.6),size:35,),
        ),
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Fully transparent AppBar
          elevation: 0, // No shadow
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(width: 20),
              MyText(text:'Budget categories',color:titleColor, fontSize: 23), // Replace MyText with Text for simplicity
            ],
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('BudgetCategories').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return  Center(
                child: CircularProgressIndicator(color:primaryColor,),
              );
            }else if(snapshot.data!.docs.isEmpty){
              return Center(
                child: MyText(
                  text:'No Orders Found!',
                ),
              );
            }
            else {
              List<DocumentSnapshot> documents = snapshot.data!.docs;
             return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: documents.length,
                itemBuilder: (BuildContext context, index) {
                  Map<String, dynamic> data = documents[index]
                      .data() as Map<String, dynamic>;
                  final random = Random();
                  final colorPair = colorPairs[random.nextInt(
                      colorPairs.length)];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 15),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: colorPair,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              MyText(text: data['category'],
                                  color: Colors.white,
                                  fontSize: 22),
                              SizedBox(width: width * 0.2),
                              MyText(text: '\$${data['totalAmount']}',
                                  color: Colors.white,
                                  fontSize: 22),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          MyText(text: 'Spent', color: Colors.white70,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              MyText(text: '\$${data['spentAmount']}',
                                color: titleColor,
                                fontSize: 20,),
                              InkWell(
                                child: Container(
                                  width: width * 0.35,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text('Edit',
                                      style: TextStyle(
                                          color: titleColor.withOpacity(
                                              0.6)))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );

            }
          },
        ),
      ),
    );
  }
}







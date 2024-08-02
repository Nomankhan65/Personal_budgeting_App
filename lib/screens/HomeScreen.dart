import 'dart:math';

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

    return Scaffold(
      floatingActionButton:FloatingActionButton(
          backgroundColor:primaryColor,
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> UploadScreen()));
          },
      child:Icon(Icons.add,color:titleColor.withOpacity(0.6),size:35,),
      ),
      extendBodyBehindAppBar: true,
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
            MyText(text:'Noman Khan',color:titleColor, fontSize: 23), // Replace MyText with Text for simplicity
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlueAccent.shade100,
                  primaryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            height: height * 0.22,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: height * 0.08,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(text:'Total: ',color: Colors.white70),
                        MyText(text:'\$300',color: Colors.white, fontSize: 18),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.08,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(text:'Expense: ',color: Colors.white70, fontSize: 18),
                        MyText(text:'\$300',color: Colors.white, fontSize: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                final random = Random();
                final colorPair = colorPairs[random.nextInt(colorPairs.length)];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors:colorPair,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MyText(text:'Food', color: Colors.white, fontSize: 22),
                            SizedBox(width: width * 0.2),
                            MyText(text:'\$300', color: Colors.white, fontSize: 22),
                          ],
                        ),
                        SizedBox(height:height* 0.01),
                        MyText(text:'Spent', color:Colors.white70,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(text:'\$120', color:titleColor,fontSize:20,),
                            InkWell(
                              child: Container(
                                width: width * 0.35,
                                height: 40,
                                decoration: BoxDecoration(
                                  color:primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:Center(child: Text('Edit', style: TextStyle(color:titleColor.withOpacity(0.6)))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}







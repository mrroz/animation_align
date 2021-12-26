
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '  انيميشن '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  int counter2 = 0;
  bool isSelected =false;
  bool remove =false;



  void _incrementCounter() {
    setState(() {
//true

      isSelected = !isSelected;

      print(isSelected);
    });
  }

  late AnimationController controller;
  late Animation animation;

@override
  void initState() {
    // TODO: implement initState
  controller = AnimationController(vsync: this , duration: Duration(seconds: 2));
    super.initState();
  }



  // size(){
  // var wi;
  // if(context.isLandscape){
  //   wi = Get.height;
  // }
  //
  // else if(context.isPortrait){
  //   wi = Get.width;
  // }
  //
  // return wi;
  //
  // }


  @override
  Widget build(BuildContext context) {


  // yel('width is ====> : ${Get.width}');
  //
  // ok('orianted is ====> :${context.orientation}');

  //size();


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [



          AnimatedAlign(
            duration: const Duration(milliseconds:1000),
            alignment: isSelected? Alignment.bottomLeft :Alignment.topRight,
            child:remove? null :AnimatedContainer(
              onEnd: (){
                print('end');
                setState(() {
                  remove=true;
                  counter2++;
                });
              },
              // curve: Curves.easeInOutSine,
              color: isSelected? Colors.green :Colors.pink,
              duration: const Duration(milliseconds: 1000),
              child: GestureDetector(
                onTap: _incrementCounter,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child:isSelected?const Icon(Icons.offline_pin_rounded,color:Colors.white,size: 35,):
                  const Icon(Icons.add,color:Colors.white,size: 35,) ,
                ),
              ),
            )
          ),


          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              //color: Colors.yellow,
              child: Stack(
                children:  [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isSelected = !isSelected;
                        remove = !remove;
                      });
                    },
                    child: CircleAvatar(
                      radius: remove?50:60,
                      backgroundColor: Colors.blue,
                      child:Icon(Icons.shopping_cart,color: Colors.white,size: 50,),
                    ),
                  ),

                  Positioned(
                    right: 2,
                    top: 5,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                      child: Text('${counter2}',style: TextStyle(color: Colors.white,fontSize: 25),),

                    ),
                  )
                ],
              ),

            ),
          )

        ],
      ),

    );
  }
}
void yel(String msg) {
  print('\x1B[33m$msg\x1B[0m');
}

void ok(String msg) {
  print('\x1B[34m$msg\x1B[0m');
}
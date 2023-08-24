import 'package:flutter/material.dart';
 void main(){
   runApp(good());
 }
class good extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Button1();
  }
}
class Button1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Scaffold(
          appBar: AppBar(title: Text('button page'),),
          body:Center(
            child: Container(
              width: 200,
              height: 200,
             color: Colors.grey,
              child: Column(
                children: [
                  OutlinedButton(
                    child: Text('Outlined butt'),
                    onPressed:(){
                      print('Elevated Button Pressed');

                    },
                    onLongPress: (){
                      print('Elevated button long pressed');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
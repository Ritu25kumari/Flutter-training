import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Firstui());

class Firstui extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    return MaterialApp

      (
      debugShowCheckedModeBanner: false,
      title: 'Flutter Container',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );

  }
}
class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body:Center(
        child: Container(
           width: 100,
           height: 100,
           color: Colors.teal,
          child: Text("Hello!!"),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Firstui());

class Firstui extends StatelessWidget {
  @override
  Widget build(BuildContext context){

  return MaterialApp

  (

  title: 'My First Flutter Application',
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
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
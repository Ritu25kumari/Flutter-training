import 'package:flutter/material.dart';
class DataModel {
  String name, email, phone, password;
  DataModel(
      {required this.name, required this.email, required this.phone, required this.password});

}
class LoginDetails extends StatelessWidget{
  final DataModel dataModel1;
  LoginDetails({required this.dataModel1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('User Detail'),),
      body:
      Column(
        children: [
          SizedBox(height: 20,),
          Container(
            height: 50,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.deepPurple, width: 2)
              ),
              child: Text('  Name :${dataModel1.name}',
              style: TextStyle(fontSize: 15),),
            ),
          ),
          Container(
            height: 50,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.deepPurple,width: 2)
              ),
              child: Text('  Email :${dataModel1.email}',
              style: TextStyle(fontSize: 15),),
            ),
          ),
          Container(
            height: 50,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.deepPurple,width: 2)
              ),
              child: Text('  Phone number :${dataModel1.phone}',
              style: TextStyle(fontSize: 15),),
            ),
          ),
          Container(
            height: 50,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.deepPurple, width: 2),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text('  Password :${dataModel1.password}',
              style: TextStyle(fontSize: 15),
                ),
            ),
          )
        ],
      ),
    );
  }

}




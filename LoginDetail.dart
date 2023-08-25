import 'package:flutter/material.dart';
class LoginDetail extends StatelessWidget{
  String name,email,phone,password;


  LoginDetail({required this.name, required this.email,required this.phone, required this.password});

  Widget build(BuildContext context) {
   return Scaffold(
     body: Column(
       children: [
         Text('Name: ${name}'),
         Text('E-mail: ${email}'),
         Text('Phone no.: ${phone}'),
         Text('Password: ${password}'),
       ],
     )
   );
  }
}




import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(SignUp());
}
class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'AppLogin',
     theme: ThemeData(primarySwatch: Colors.deepPurple),
     home: LogIn(),
   );
  }
}

class LogIn extends StatefulWidget{
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final ImagePicker imagePicker=ImagePicker();
  File? image;

  var usertext = TextEditingController();
  var emailtext =  TextEditingController();
  var phonetext = TextEditingController();
  var passtext = TextEditingController();

  void pickImage()async
  {

   final imagePicked= await  imagePicker.pickImage(source: ImageSource.camera);
   if(imagePicked!=null)
     {
       image=File(imagePicked.path);
       setState(() {

       });
     }
  }

  @override
  Widget build(BuildContext context) {
   return Center(
     child: Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: AppBar(title: Text('LogIn Page'),),
       body: Padding(
         padding: const EdgeInsets.all(15.0),
         child: Center(
           child: Container(
             width: 300,
             height: 500,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(height: 20,),
                 TextField(
                   keyboardType: TextInputType.name,
                   controller: usertext,
                   decoration: InputDecoration(
                     labelText: 'User name',
                     hintText: 'Enter Username',
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                             color: Colors.orange,
                           width: 2
                         )
                     ),
                     enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                             color: Colors.deepPurple,
                           width: 2
                         )
                     ),
                     disabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(
                         color: Colors.grey
                       )
                     ),
                     prefixIcon: IconButton(
                       icon: Icon(Icons.account_circle),
                       onPressed: (){},
                     ),

                   ),
                 ),

                 SizedBox(height: 20,),
                 TextField(
                   keyboardType: TextInputType.emailAddress,
                   controller: emailtext ,
                   decoration: InputDecoration(
                     labelText: 'email',
                     hintText: 'Enter E-mail',
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                             color: Colors.orange,
                             width: 2
                         )
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(
                         color: Colors.deepPurple,
                         width: 2
                       )
                     ),
                     prefixIcon: IconButton(
                       icon: Icon(Icons.email),
                       onPressed:(){},
                     ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 TextField(
                   keyboardType: TextInputType.phone,
                   controller: phonetext,
                   decoration: InputDecoration(
                     labelText: 'phone_no',
                     hintText: 'Enter phone number',
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                             color: Colors.orange,
                             width: 2
                         )
                     ),
                     enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                             color: Colors.deepPurple,
                           width: 2
                         )
                     ),
                     prefixIcon: IconButton(
                       icon: Icon(Icons.phone),
                       onPressed: (){},
                     ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 TextField(
                   controller: passtext,
                   obscureText: true,
                   decoration: InputDecoration(
                     labelText: 'password',
                     hintText: 'Enter Password',
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                             color: Colors.orange,
                             width: 2
                         )
                     ),
                     enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                             color: Colors.deepPurple,
                             width: 2
                         )
                     ),
                     prefixIcon: IconButton(
                       icon: Icon(Icons.key),
                       onPressed: (){},
                     ),
                   ),
                 ),
                 SizedBox(height: 20 ,),
                 SizedBox(
                   height: 40,
                   width: 150,
                   child: OutlinedButton(
                     child: Text('login', style: TextStyle(fontSize: 18),),
                     style: OutlinedButton.styleFrom(
                         primary: Colors.white,
                         backgroundColor: Colors.deepPurple,
                     ),

                     onPressed:(){
                           // String Name = usertext.text;
                           // String Email = emailtext.text;
                           // String PhoneNo = phonetext.text;
                           // String Password = passtext.text;
                       pickImage();
                         }
                         ),
                 ),


               ],
             ),
           ),
         ),
       ),
     ),
   );
  }
}




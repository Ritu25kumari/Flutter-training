import 'package:flutter/material.dart';

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
class LogIn extends StatelessWidget{
  var usertext = TextEditingController();
  var emailtext =  TextEditingController();
  var phonetext = TextEditingController();
  var passtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Center(
     child: Scaffold(
       appBar: AppBar(title: Text('LogIn Page'),),
       body: Padding(
         padding: const EdgeInsets.all(15.0),
         child: Center(
           child: Container(
             width: 300,
             height: 400,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(height: 20,),
                 TextField(
                   keyboardType: TextInputType.name,
                   controller: usertext,
                   decoration: InputDecoration(
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
                     suffixIcon: IconButton(
                       icon: Icon(Icons.account_circle),
                       onPressed: (){},
                     ),
                     hintText: 'Enter Username',
                   ),
                 ),

                 SizedBox(height: 20,),
                 TextField(
                   keyboardType: TextInputType.emailAddress,
                   controller: emailtext ,
                   decoration: InputDecoration(
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
                     suffixIcon: IconButton(
                       icon: Icon(Icons.email),
                       onPressed:(){},
                     ),
                     hintText: 'Enter E-mail',
                   ),
                 ),
                 SizedBox(height: 20,),
                 TextField(
                   keyboardType: TextInputType.phone,
                   controller: phonetext,
                   decoration: InputDecoration(
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
                     suffixIcon: IconButton(
                       icon: Icon(Icons.phone),
                       onPressed: (){},
                     ),
                     hintText: 'Enter phone number',
                   ),
                 ),
                 SizedBox(height: 20,),
                 TextField(
                   controller: passtext,
                   obscureText: true,
                   decoration: InputDecoration(
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
                     suffixIcon: IconButton(
                       icon: Icon(Icons.remove_red_eye),
                       onPressed: (){},

                     ),
                     hintText: 'Enter Password',
                   ),
                 ),
                 SizedBox(height: 20,),
                 OutlinedButton(
                   child: Text('login'),
                   style: OutlinedButton.styleFrom(
                       primary: Colors.white,
                       backgroundColor: Colors.deepPurple
                   ),
                   onPressed:(){
                     String Name = usertext.text;
                     String Email = emailtext.text;
                     String PhoneNo = phonetext.text;
                     String Password = passtext.text;

                     print("Name: $Name, Email: $Email, PhoneNumber: $PhoneNo, Password: $Password");
                   },

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


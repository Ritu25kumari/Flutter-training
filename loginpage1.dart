import 'package:flutter/material.dart';
import 'LoginDetail.dart';
void main(){
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: LoginApp (),
     theme: ThemeData(primarySwatch: Colors.deepPurple),
   );
  }
}

class LoginApp extends StatefulWidget {
  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp>{
   final TextEditingController _uname =  TextEditingController();
   final TextEditingController _email =  TextEditingController();
   final TextEditingController _phone = TextEditingController();
   final TextEditingController _pass = TextEditingController();
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Login Form'),),
      body: Center(
        child: Container(
            height: 600,
            width: 300,
            child: Form(
              key: _formKey,
              child:Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _uname,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'User name',
                      hintText: 'Enter Username',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.orange,
                              width: 2
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.deepPurple,
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
                    validator: (value){
                      if(value!.isEmpty){
                        return'Please enter your username';
                      }
                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
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
                    validator: (value){
                      if(value!.isEmpty){
                        return'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phone,
                    keyboardType: TextInputType.phone,
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
                    validator: (value){
                      if(value!.isEmpty){
                        return'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _pass,
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
                    validator: (value){
                      if(value!.isEmpty){
                        return'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(onPressed: (){

                    if(_formKey.currentState!.validate())
                      {
                        DataModel datamodel = DataModel(
                            name: _uname.text,
                            email: _email.text,
                            phone: _phone.text,
                            password: _pass.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginDetails(dataModel1: datamodel),
                          ),
                        );
                      }


                  }, child: Text('Login')),
                )
              ]),
            )
        ),
      ),
    );
  }
}


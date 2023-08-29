import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class DataModel {
  String name, email, phone, password;

  DataModel({required this.name, required this.email, required this.phone, required this.password});
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Passing Example',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LogInPage(),
    );
  }
}

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController _uname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _uname,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'username',
                    hintText: 'Enter username',
                    focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.tealAccent,
                  width: 2
              )
        ),
        enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.black,
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
                    hintText: 'Enter your email',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.tealAccent,
                          width: 2
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                      )
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.email),
                    onPressed:(){},
                  ),
                ),
                validator: (value) {
                   if (value!.isEmpty) {
                      return 'Please enter your email';
                     }
                     return null;
                     }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: 'phone number',
                    hintText: 'Enter your phone number',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.tealAccent,
                          width: 2
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
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
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'Enter 8 digit password',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.tealAccent,
                          width: 2
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                DataModel dataModel = DataModel(
                  name: _uname.text,
                  email: _email.text,
                  phone: _phone.text,
                  password: _password.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayScreen(dataModel: dataModel),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayScreen extends StatelessWidget {
  final DataModel dataModel;

  DisplayScreen({required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('uname: ${dataModel.name}'),
            Text('email: ${dataModel.email}'),
            Text('phone: ${dataModel.phone}'),
            Text('password: ${dataModel.password}'),
          ],
        ),
      ),
    );
  }
}

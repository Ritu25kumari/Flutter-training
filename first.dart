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














//asyncronous programming
//import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Programming Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _data = 'Fetching data...';

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget is initialized.
  }

  Future<void> fetchData() async {
    // Simulating an API call that takes some time.
    await Future.delayed(Duration(seconds: 2));

    // Simulated response from the API.
    String apiResponse = 'Fetched data from API';

    setState(() {
      _data = apiResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Programming Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _data,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}







import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class UserController extends GetxController {
 // UserInfoModel? userinfomodel;
  final userlist = <UserInfoModel>[];
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  void onInit() async{
    super.onInit();
    getUserData();
  }
  void getUserData() async{
    try{
      final userdata = await GetApi().fetchUsersData();
      
      if(userdata!=null){
        userlist.addAll(userdata);
      }
    }
    catch(e){
      print('Error: $e');
      return null;
    }

  }

}
 
class GetApi {
  Future<UserInfoModel> fetchUsersData() async {
    var response = await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      final userinforesponse = UserInfoModel.fromJson(data);
      print(userinforesponse);
      return userinforesponse;
    } else {
      throw Exception('Network problem');
    }
  }
 
}

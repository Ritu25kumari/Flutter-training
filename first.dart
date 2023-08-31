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

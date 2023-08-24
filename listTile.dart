import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return listTile();
  }
}
class listTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var arrNames = ['Ritu','Pumori','Prachi','Muskan','Pooja','Jaspreet','Megha'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: Text('ListTile Widget'),),
        body: Container(
          child: ListView.separated(itemBuilder:(context, index) {
            return ListTile(
              leading: Text('${index+1}'),
              title:Text( arrNames[index]),
              subtitle: Text('Number'),
              trailing: Icon(Icons.add),

            );
          },
          itemCount: arrNames.length,
          separatorBuilder: (context, index){
            return Divider(height: 100,thickness: 1,);
          },),
        )
      ),
    );
  }
}


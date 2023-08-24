import 'package:flutter/material.dart';
void main(){
  runApp(myApp());
}

class  myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return rowColumn();
  }
}
class rowColumn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home:Scaffold(
       appBar: AppBar(title: Text('ROW&COLUMN Wiget'),),
       body: Container(
           color: Colors.grey,
           child: Column(   //Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children:<Widget> [
               Row(
                 children: [
                   Text("1",style: TextStyle(fontSize: 10),),
                   Text("2",style: TextStyle(fontSize: 10),),
                   Text("3",style: TextStyle(fontSize: 10),),
                   Text("4",style: TextStyle(fontSize: 10),),
                   Text("5",style: TextStyle(fontSize: 10),),
                 ],
               ),
               Text("Ritu",style: TextStyle(fontSize: 10),),
               Text("Pumori",style: TextStyle(fontSize: 10),),
               Text("Muskan",style: TextStyle(fontSize: 10),),
               Text("Jaspreet",style: TextStyle(fontSize: 10),),
               Text("Megha",style: TextStyle(fontSize: 10),),
               ElevatedButton(onPressed: (){
                 print('select one');

               },
                             child: Text('click')
               )

             ],
         ),
       ),
     ) ,
   );
  }
}
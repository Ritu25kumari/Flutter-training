import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.teal
        ,
      ),
      home: ImagePickerApp(),
    );
  }
}
class ImagePickerApp extends StatefulWidget{
  @override
  _ImagePickerAppState createState()=> _ImagePickerAppState();
}
class _ImagePickerAppState extends State<ImagePickerApp>{
  File? _image;
  Future getImage(ImageSource source) async{
    final image = await ImagePicker().pickImage(source: source);
    if(image == null)
      return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Image Picker')),
      ),
      body: Center(
          child: Column(children: [
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  height:250,
                  width: 250,
                  child: _image != null ? Image.file(_image!, width: 250,height: 250,fit: BoxFit.cover,):
                  Image.network('https://relevant.software/wp-content/uploads/flutter-e1625644676239.png')),
            ),
            SizedBox(width: 10,),
            CustomButton(
                title: 'Select From Camera',
                icon: Icons.camera_alt_outlined,
                onClick:(){getImage(ImageSource.camera);}
            ),
            SizedBox(width: 10,),
            CustomButton(
                title: 'Select From Gallery',
                icon: Icons.image_outlined,
                onClick:() {getImage(ImageSource.gallery);}
            ),
          ],)
      ),
    );
  }
}
Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}
){
  return Container(
    width: 300,
    child: ElevatedButton (child: Row(children: [
      Icon(icon),
      SizedBox(width: 10,),
      Text(title),

    ],),
    onPressed: onClick
    ),
  );
}

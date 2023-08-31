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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ImagePicker imagePicker=ImagePicker();
  File? image;



  Future<void> _pickImage(ImageSource source) async {
    final imagePicked= await  imagePicker.pickImage(source:source);
    if(imagePicked!=null)
    {
      image= File(imagePicked.path);
      setState(() {
        image = image;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Image Picker App')),
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image!=null
                  ? Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:FileImage(
                      image!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  : Container(
                  height: 200,
                  width: 200,
                  color: Colors.black,
                  child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzo3D3B_CF6srVS2O7DFqdNmBKH_HQCpUCK8HXlCAyJSGwCmvmtEsUS4ja1aSPpPPeuU4&usqp=CAU')),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Row(
                  children: [
                    Icon(Icons.image_outlined),
                    SizedBox(width: 10),
                    Text('Select Image from Gallery'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    SizedBox(width: 10,),
                    Text('Select Image from Camera'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
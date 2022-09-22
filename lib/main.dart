// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //we first need to add 2 important plugins
  //path provider to get the oath of the fles
  //image picker which is cool plugin that allow us to pick image from difference sources
  //create new objects

  File? _image;
  //now let's create and instanciate our ImagePicker object
  final imagePicker = ImagePicker();
  //no let's create a new function to get the Image from the camera
  Future getImage() async {
    final image = await imagePicker.getImage(
        source: ImageSource
            .camera); //this line will allow us to access the camera and get the picture

    setState(() {
      //now let's assign the image path to our image file
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null
            ? Text('No Image Selected')
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                ),
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                  
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}

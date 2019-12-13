import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:picture_picker/picture_picker.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Picker Plugin example app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(),
          RaisedButton(
              child: Text('打开相册'),
              onPressed: () {
                print('打开相册');
                openSelect();
              }),
          Container(height: 20),
          RaisedButton(
              child: Text('打开相机'),
              onPressed: () {
                print('打开相机');
                openCamera();
              }),
       
        ],
      ),
    );
  }

  openSelect() async {
    PicturePickerOptions pickerOptions = PicturePickerOptions();
    var list = await PicturePicker.openSelect(pickerOptions);
    print(list);
  }

  openCamera() async {
    PicturePickerOptions pickerOptions = PicturePickerOptions();
    var list = await PicturePicker.openCamera(pickerOptions);
    print(list);
  }
}

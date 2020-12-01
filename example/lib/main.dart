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
          const Center(),
          RaisedButton(
              child: const Text('打开相册'),
              onPressed: () {
                print('打开相册');
                openSelect();
              }),
        ],
      ),
    );
  }

  Future<void> openSelect() async {
    final PicturePickerOptions pickerOptions = PicturePickerOptions();
    final List<AssetMedia> list = await openImagePicker(pickerOptions);
    print(list);
  }
}

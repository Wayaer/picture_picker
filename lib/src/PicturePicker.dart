import 'package:flutter/services.dart';
import 'package:picture_picker/src/AssetMedia.dart';
import 'package:picture_picker/src/PicturePickerOptions.dart';

class PicturePicker {
  static const MethodChannel channel = const MethodChannel('PicturePicker');

//  openSelect() async {
//    PicturePickerOptions pickerOptions = PicturePickerOptions();
//    pickerOptions.selectValueType = 0;
//    pickerOptions.previewVideo = true;
//    var list = await PicturePicker.openSelect(pickerOptions);
//    print(list);
//  }
  static Future<List<AssetMedia>> openSelect(
      [PicturePickerOptions selectOptions]) async {
    if (selectOptions == null) selectOptions = PicturePickerOptions();
    final image =
        await channel.invokeMethod('openSelect', selectOptions.toJson());
    if (image is List) {
      return Future.value(
          image.map((data) => AssetMedia.fromJson(data)).toList());
    } else {
      return Future.value(image);
    }
  }

  static Future<List<AssetMedia>> openCamera(
      [PicturePickerOptions selectOptions]) async {
    if (selectOptions == null) selectOptions = PicturePickerOptions();
    final camera =
        await channel.invokeMethod('openCamera', selectOptions.toJson());
    if (camera is List) {
      return Future.value(
          camera.map((data) => AssetMedia.fromJson(data)).toList());
    } else {
      return Future.value(camera);
    }
  }
}

import 'package:flutter/cupertino.dart';
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
  static  openSelect(
      [PicturePickerOptions selectOptions]) async {
    if (selectOptions == null) selectOptions = PicturePickerOptions();
    final image =
        await channel.invokeMethod('openSelect', selectOptions.toJson());
    debugPrint(image);
    if (image is List) {
      return Future.value(
          image.map((data) => AssetMedia.fromJson(data)).toList());
    } else {
      return image;
    }
  }

  static openCamera(
      [PicturePickerOptions selectOptions]) async {
    if (selectOptions == null) selectOptions = PicturePickerOptions();
    final camera =
        await channel.invokeMethod('openCamera', selectOptions.toJson());
    debugPrint(camera);
    if (camera is List) {
      return Future.value(
          camera.map((data) => AssetMedia.fromJson(data)).toList());
    } else {
      return camera;
    }
  }

  /// [selectValueType] 0:全部类型，1:图片，2:视频，3:音频
  static Future deleteCacheDirFile({int selectValueType = 0}) async {
    return channel.invokeMethod(
        'deleteCacheDirFile', {'selectValueType': selectValueType});
  }
}

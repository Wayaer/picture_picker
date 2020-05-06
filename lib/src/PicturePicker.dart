import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:picture_picker/src/AssetMedia.dart';
import 'package:picture_picker/src/PicturePickerOptions.dart';

class PicturePicker {
  static const MethodChannel channel = const MethodChannel('PicturePicker');

  ///  openSelect() async {
  ///    PicturePickerOptions pickerOptions = PicturePickerOptions();
  ///    pickerOptions.selectValueType = 0;
  ///    pickerOptions.previewVideo = true;
  ///    var list = await PicturePicker.openSelect(pickerOptions);
  ///    print(list);
  ///  }
  static Future<List<AssetMedia>> openSelect(
      [PicturePickerOptions selectOptions]) async {
    if (selectOptions == null) selectOptions = PicturePickerOptions();
    final result =
    await channel.invokeMethod('openSelect', selectOptions.toJson());
    debugPrint(result.toString());
    if (result is List) {
      return Future.value(
          result.map((data) => AssetMedia.fromJson(data)).toList());
    } else {
      return Future.value([]);
    }
  }

  static Future<List<AssetMedia>> openCamera(
      [PicturePickerOptions selectOptions]) async {
    if (selectOptions == null) selectOptions = PicturePickerOptions();
    final result =
    await channel.invokeMethod('openCamera', selectOptions.toJson());
    debugPrint(result.toString());
    if (result is List) {
      return Future.value(
          result.map((data) => AssetMedia.fromJson(data)).toList());
    } else {
      return Future.value([]);
    }
  }

  /// [selectValueType] 0:全部类型，1:图片，2:视频，3:音频
  static Future deleteCacheDirFile({int selectValueType = 0}) async {
    return channel.invokeMethod(
        'deleteCacheDirFile', {'selectValueType': selectValueType});
  }
}

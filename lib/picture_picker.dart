export 'model.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:picture_picker/model.dart';

const MethodChannel _channel = const MethodChannel('PicturePicker');

///  openPicker() async {
///    PicturePickerOptions pickerOptions = PicturePickerOptions();
///    pickerOptions.selectValueType = 0;
///    pickerOptions.previewVideo = true;
///    var list = await PicturePicker.openPicker(pickerOptions);
///    print(list);
///  }
Future<List<AssetMedia>> openImagePicker(
    [PicturePickerOptions selectOptions]) async {
  if (_supportPlatform()) return null;
  selectOptions ??= PicturePickerOptions();
  if (selectOptions.maxSelectNum < 1) selectOptions.maxSelectNum = 1;
  final List<dynamic> result =
      await _channel.invokeMethod('openImagePicker', selectOptions.toJson());
  if (result is! List) return null;
  final List<AssetMedia> list = <AssetMedia>[];
  for (final dynamic data in result) {
    list.add(AssetMedia.fromJson(data as Map<dynamic, dynamic>));
  }
  return list;
}

/// [selectValueType] 0:全部类型，1:图片，2:视频
Future<String> deleteCacheDirFile({int selectValueType = 0}) async {
  if (_supportPlatform()) return null;
  return _channel.invokeMethod(
      'deleteCacheDirFile', <String, int>{'selectValueType': selectValueType});
}

bool _supportPlatform() {
  if (!(Platform.isAndroid || Platform.isIOS)) {
    print('Curiosity is not support ${Platform.operatingSystem}');
    return true;
  }
  return false;
}

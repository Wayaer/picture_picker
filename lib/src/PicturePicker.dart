import 'package:flutter/services.dart';
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
  static openSelect([PicturePickerOptions selectOptions]) async {
    if (selectOptions == null) selectOptions = PicturePickerOptions();
    final image =
        await channel.invokeMethod('openSelect', selectOptions.toJson());
    return image;
  }

  static openCamera([PicturePickerOptions selectOptions]) async {
    if (selectOptions == null) selectOptions = PicturePickerOptions();
    final camera =
        await channel.invokeMethod('openCamera', selectOptions.toJson());
    return camera;
  }
}

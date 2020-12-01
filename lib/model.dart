import 'dart:convert';

class AssetMedia {
  AssetMedia(
      {this.compressPath,
      this.duration,
      this.height,
      this.path,
      this.size,
      this.width,
      this.fileName,
      this.mediaType});

  AssetMedia.fromJson(Map<dynamic, dynamic> json) {
    compressPath = json['compressPath'] as String;
    duration = json['duration'] as int;
    path = json['path'] as String;
    size = intToDouble(json, 'size');
    height = intToDouble(json, 'height');
    width = intToDouble(json, 'width');
    fileName = json['fileName'] as String;
    mediaType = json['mediaType'] == null ? '' : json['mediaType'].toString();
  }

  double intToDouble(Map<dynamic, dynamic> json, String key) {
    final dynamic data = json[key];
    if (data is int) data.toDouble();
    if (data is double) return data;
    return null;
  }

  String compressPath;
  int duration;

  ///  MediaTypeUnknown = 0, MediaTypeImage = 1,  MediaTypeVideo = 2, MediaTypeAudio = 3,
  ///  only ios
  String mediaType;
  double height;
  String path;
  double size;
  double width;
  String fileName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['compressPath'] = compressPath;
    data['duration'] = duration;
    data['height'] = height;
    data['height'] = height;
    data['path'] = path;
    data['size'] = size;
    data['width'] = width;
    data['fileName'] = fileName;
    data['mediaType'] = mediaType;
    return data;
  }

  @override
  String toString() => json.encode(this);
}

class PicturePickerOptions {
  PicturePickerOptions(
      {this.maxSelectNum = 6,
      this.minSelectNum = 1,
      this.imageSpanCount = 4,
      this.minimumCompressSize = 100,
      this.cropCompressQuality = 90,
      this.videoQuality = 0,
      this.videoMaxSecond = 60,
      this.videoMinSecond = 5,
      this.recordVideoSecond = 60,
      this.previewImage = false,
      this.previewVideo = false,
      this.isZoomAnim = true,
      this.isCamera = false,
      this.compress = false,
      this.freeStyleCropEnabled = false,
      this.openClickSound = false,
      this.isGif = false,
      this.setOutputCameraPath = '',
      this.originalPhoto = false,
      this.pickerSelectType = 0});

  ///  支持ios && android
  ///
  ///   最大图片选择数量 int
  int maxSelectNum;

  ///  是否显示原图按钮
  bool originalPhoto;

  ///   最小选择数量 int
  int minSelectNum;

  ///  显示多少秒以内的视频or音频也可适用 int
  int videoMaxSecond;

  ///  全部0、图片1、视频2
  int pickerSelectType;

  ///   是否可预览图片 true or false
  bool previewImage;

  ///   是否显示拍照按钮 true or false
  bool isCamera;

  ///   是否显示gif图片 true or false
  bool isGif;

  ///  android 以下为仅支持 android
  ///
  ///   每行显示个数 int
  int imageSpanCount;

  ///   裁剪压缩质量 默认90 int
  int cropCompressQuality;

  ///   小于100kb的图片不压缩
  int minimumCompressSize;

  ///  视频录制质量 0 or 1 int
  int videoQuality;

  ///   显示多少秒以内的视频or音频也可适用 int
  int videoMinSecond;

  ///  视频秒数录制 默认60s int
  int recordVideoSecond;

  ///   是否可预览视频 true or false
  bool previewVideo;

  ///   图片列表点击 缩放效果 默认true
  bool isZoomAnim;

  ///   是否压缩 true or false
  bool compress;

  ///   裁剪框是否可拖拽 true or false
  bool freeStyleCropEnabled;

  ///   是否开启点击声音 true or false
  bool openClickSound;

  ///   自定义拍照保存路径,可不填
  String setOutputCameraPath;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxSelectNum'] = maxSelectNum ?? 6;
    data['minSelectNum'] = minSelectNum;
    data['imageSpanCount'] = imageSpanCount;
    data['minimumCompressSize'] = minimumCompressSize;
    data['cropCompressQuality'] = cropCompressQuality;
    data['videoQuality'] = videoQuality;
    data['videoMaxSecond'] = videoMaxSecond;
    data['videoMinSecond'] = videoMinSecond;
    data['recordVideoSecond'] = recordVideoSecond;
    data['previewImage'] = previewImage;
    data['previewVideo'] = previewVideo;
    data['isZoomAnim'] = isZoomAnim;
    data['compress'] = compress;
    data['isCamera'] = isCamera;
    data['freeStyleCropEnabled'] = freeStyleCropEnabled;
    data['openClickSound'] = openClickSound;
    data['isGif'] = isGif;
    data['pickerSelectType'] = pickerSelectType;
    data['setOutputCameraPath'] = setOutputCameraPath;
    data['originalPhoto'] = originalPhoto;
    return data;
  }
}

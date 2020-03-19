import 'dart:convert' show json;

import 'package:flutter/foundation.dart';

dynamic convertValueByType(value, Type type, {String stack: ""}) {
  if (value == null) {
    debugPrint("$stack : value is null");
    if (type == String) {
      return "";
    } else if (type == int) {
      return 0;
    } else if (type == double) {
      return 0.0;
    } else if (type == bool) {
      return false;
    }
    return null;
  }

  if (value.runtimeType == type) {
    return value;
  }
  var valueS = value.toString();
  debugPrint("$stack : ${value.runtimeType} is not $type type");
  if (type == String) {
    return valueS;
  } else if (type == int) {
    return int.tryParse(valueS);
  } else if (type == double) {
    return double.tryParse(valueS);
  } else if (type == bool) {
    valueS = valueS.toLowerCase();
    var intValue = int.tryParse(valueS);
    if (intValue != null) {
      return intValue == 1;
    }
    return valueS == "true";
  }
}

void tryCatch(Function f) {
  try {
    f?.call();
  } catch (e, stack) {
    debugPrint("$e");
    debugPrint("$stack");
  }
}

class AssetMedia {
  int height;
  String fileName;
  String path;
  int size;
  int width;
  String cropPath;
  String compressPath;

  AssetMedia({
    this.height,
    this.fileName,
    this.path,
    this.size,
    this.width,
    this.cropPath,
    this.compressPath,
  });

  factory AssetMedia.fromJson(jsonRes) => jsonRes == null
      ? null
      : AssetMedia(
          height: convertValueByType(jsonRes['height'], int,
              stack: "AssetMedia-height"),
          fileName: convertValueByType(jsonRes['fileName'], String,
              stack: "AssetMedia-fileName"),
          path: convertValueByType(jsonRes['path'], String,
              stack: "AssetMedia-path"),
          size: convertValueByType(jsonRes['size'], int,
              stack: "AssetMedia-size"),
          width: convertValueByType(jsonRes['width'], int,
              stack: "AssetMedia-width"),
          cropPath: convertValueByType(jsonRes['cutPath'], String,
              stack: "AssetMedia-cutPath"),
          compressPath: convertValueByType(jsonRes['compressPath'], String,
              stack: "AssetMedia-compressPath"),
        );

  Map<String, dynamic> toJson() => {
        'height': height,
        'fileName': fileName,
        'path': path,
        'size': size,
        'width': width,
        'cutPath': cropPath,
        'compressPath': compressPath,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

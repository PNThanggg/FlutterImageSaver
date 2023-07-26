import 'dart:async';

import 'package:flutter/services.dart';

class ImageGallerySaver {
  static const MethodChannel _channel = MethodChannel('image_gallery_saver');

  static FutureOr<dynamic> saveImage(Uint8List imageBytes,
      {int quality = 80, String? name, bool isReturnImagePathOfIOS = false}) async {
    final result = await _channel.invokeMethod(
      'saveImageToGallery',
      <String, dynamic>{
        'imageBytes': imageBytes,
        'quality': quality,
        'name': name,
        'isReturnImagePathOfIOS': isReturnImagePathOfIOS
      },
    );
    return result;
  }

  static Future saveFile(String file, {String? name, bool isReturnPathOfIOS = false}) async {
    final result = await _channel.invokeMethod(
      'saveFileToGallery',
      <String, dynamic>{
        'file': file,
        'name': name,
        'isReturnPathOfIOS': isReturnPathOfIOS,
      },
    );
    return result;
  }
}

import 'dart:typed_data';

import 'package:image/image.dart' as decode_image;

class CompressUtility {
  /// compress image buffer by decode writing
  static Future<Uint8List?> compressImageBuffer(CompressImageInfo compressImageInfo) {

    final Uint8List imageBuffer = compressImageInfo.imageBuffer;
    final int quality = compressImageInfo.quality;
    final double? scale = compressImageInfo.scale;

    // set the input image file
    try {
      decode_image.Image? decodeImg = decode_image.decodeImage(imageBuffer);
      if (decodeImg == null) {
        return Future.value(null);
      }

      if (scale != null) {
        int resizeWidth = (decodeImg.width * scale).round();
        int resizeHeight = (decodeImg.height * scale).round();
        decode_image.Image resizedImg = decode_image.copyResize(decodeImg!, width: resizeWidth, height: resizeHeight);
        decodeImg = resizedImg;
      }

      List<int> jpgBuf = decode_image.encodeJpg(decodeImg, quality: quality);
      Uint8List result = Uint8List.fromList(jpgBuf);

      return Future.value(result);
    } catch (e) {
      print(e);
      return Future.value(null);
    }

  }
}

/// compress image param
class CompressImageInfo {
  /// image buffer
  final Uint8List imageBuffer;

  /// scale of image.
  /// 1 : normal , expand > 1, contract < 1
  final double? scale;

  /// image quality
  /// 100 : normal, compress < 100
  final int quality;

  /// compress image param
  CompressImageInfo({
    required this.imageBuffer,
    this.scale,
    this.quality = 50,
  });
}
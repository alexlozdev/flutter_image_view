import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';

import 'package:http/http.dart' as http;
import 'package:image/image.dart' as decode_image;

import 'constants.dart';

class CommonExtendedImageView extends StatefulWidget {

  /// widget width
  final double? width;

  /// image url
  final String imgUrl;

  /// image buffer
  final Uint8List? imgBuffer;

  /// image fit
  final BoxFit? fit;

  /// error widget
  final Widget errorWidget;

  /// display icon when loading image
  final bool placeholder;

  /// image border radius
  final double? radius;

  /// image view to display image url (network, local, web) and image buffer.
  /// support rounded image
  const CommonExtendedImageView({
    Key? key,
    this.width,
    this.imgUrl = '',
    this.imgBuffer,
    this.fit,
    this.errorWidget = const Icon(Icons.error),
    this.placeholder = true,
    this.radius,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CommonExtendedImageViewState();
}

class CommonExtendedImageViewState extends State<CommonExtendedImageView> with WidgetsBindingObserver {
  Uint8List? _imageBuffer;
  Size? _imageSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    getSize(url: widget.imgUrl);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didUpdateWidget(CommonExtendedImageView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.imgUrl != widget.imgUrl) {
      getSize(url: widget.imgUrl);
    }
  }


  @override
  Widget build(BuildContext context) {

    Widget? child;

    const FilterQuality filterQuality = FilterQuality.low;
    if (widget.imgBuffer != null || widget.imgUrl.isNotEmpty) {
      try {
        if (widget.imgBuffer != null) {
          child = ExtendedImage.memory(widget.imgBuffer!,
            fit: widget.fit,
            width: widget.width,
            filterQuality: filterQuality,
          );
        } else if (_imageBuffer != null) {
          double width = 200;
          if (widget.width != null) {
            width = widget.width!;
          }

          double? ratio;
          if (_imageSize != null && _imageSize!.width != 0) {
            ratio = width / _imageSize!.width;
          }

          child = ExtendedImage.memory(_imageBuffer!,
            fit: widget.fit,
            width: widget.width,
            compressionRatio: ratio,
          );
        } else {
          child = widget.errorWidget;
        }
      } catch (e) {
        child = widget.errorWidget;
      }
    }

    return getClipRect(
      child: child ?? widget.errorWidget,
    );
  }

  Widget getClipRect({
    required Widget child,
  }) {
    if (widget.radius == null) {
      return child;
    }

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(widget.radius!)),
      child: child,
    );
  }

  /// get bytes from image on web and local
  Future<Uint8List?> getBytesFromImageMobileWeb(String filePath) {

    if (filePath.startsWith(Constants.urlHttp)) {
      Uri uri = Uri.parse(filePath);

      return http.readBytes(uri).then((value) {
        return value;
      }).catchError((e) {
        return null;
      });

    } else {
      File file = File(filePath);

      return file.readAsBytes().then((value) {
        return value;
      });
    }
  }

  Future<void> getSize({required String url}) {
    return getBytesFromImageMobileWeb(url).then((value) {

      setState(() {
        _imageBuffer = value;
        if (value != null) {
          decode_image.Image? decodeImg = decode_image.decodeImage(value);

          if (decodeImg != null) {
            _imageSize = Size(decodeImg.width, decodeImg.height);
          }
        }
      });

    });
  }


}
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';


class CommonImageView extends StatelessWidget {
  /// width
  final double? width;

  /// height
  final double? height;

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
  const CommonImageView({
    Key? key,
    this.width,
    this.height,
    this.imgUrl = '',
    this.imgBuffer,
    this.fit,
    this.errorWidget = const Icon(Icons.error),
    this.placeholder = true,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget? child;

    const FilterQuality filterQuality = FilterQuality.low;
    if (imgBuffer != null || imgUrl.isNotEmpty) {
      try {
        if (imgBuffer != null) {
          child = Image.memory(imgBuffer!,
            width: width,
            height: height,
            fit: fit,
            filterQuality: filterQuality,
          );
        } else if (imgUrl.startsWith(Constants.urlHttp)) {
          // network image url
          child = CachedNetworkImage(
            imageUrl: imgUrl,
            width: width,
            height: height,
            placeholder: placeholder ? (context, url) => const CircularProgressIndicator(
              strokeWidth: 2.0,
              color: Constants.focusColor,
            ) : null,
            errorWidget: (context, url, error) => errorWidget,
            fit: fit,
            filterQuality: filterQuality,
          );
        } else if (imgUrl.startsWith('blob:')) {
          child = Image.network(imgUrl,
            width: width,
            height: height,
            fit: fit,
            filterQuality: filterQuality,
          );
        } else if (imgUrl.startsWith('assets')) {
          child = Image.asset(imgUrl,
            fit: fit,
            width: width,
            height: height,
            filterQuality: filterQuality,
          );
        } else {
          // local temp image url
          child = Image.file(File(imgUrl),
            fit: fit,
            width: width,
            height: height,
            filterQuality: filterQuality,
          );
        }
      } catch (e) {
        child = errorWidget;
      }
    }

    return getClipRect(
      child: child ?? errorWidget,
    );
  }

  Widget getClipRect({
    required Widget child,
  }) {
    if (radius == null) {
      return child;
    }

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius!)),
      child: child,
    );
  }
}
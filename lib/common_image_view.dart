import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';


class CommonImageView extends StatelessWidget {

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
    this.imgUrl = '',
    this.imgBuffer,
    this.fit,
    this.errorWidget = const Icon(Icons.error),
    this.placeholder = true,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ImageProvider? imageProvider = getImageProvider();

    return getClipRect(
      child: imageProvider != null ? Image(image: ResizeImage(imageProvider!, width: 500)) : errorWidget,
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

  ImageProvider? getImageProvider() {
    ImageProvider? child;

    if (imgBuffer == null && imgUrl.isEmpty) {
      return null;
    }

    if (imgUrl.startsWith(Constants.urlHttp)) {
      // network image url
      child = CachedNetworkImageProvider(imgUrl,
      );
    } else if (imgUrl.startsWith('blob:')) {
      child = NetworkImage(imgUrl,
      );
    } else if (imgUrl.startsWith('assets')) {
      child = AssetImage(imgUrl,
      );
    } else {
      // local temp image url
      child = FileImage(File(imgUrl),
      );
    }

    return child;
  }
}
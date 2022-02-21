/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');
  AssetGenImage get carRepair =>
      const AssetGenImage('assets/images/car_repair.png');
  AssetGenImage get check => const AssetGenImage('assets/images/check.png');
  AssetGenImage get deliveryTruck =>
      const AssetGenImage('assets/images/delivery_truck.png');
  AssetGenImage get dogWalking =>
      const AssetGenImage('assets/images/dog_walking.png');
  AssetGenImage get house => const AssetGenImage('assets/images/house.png');
  AssetGenImage get laundryBasket =>
      const AssetGenImage('assets/images/laundry_basket.png');
  AssetGenImage get map => const AssetGenImage('assets/images/map.jpeg');
  AssetGenImage get money => const AssetGenImage('assets/images/money.png');
  AssetGenImage get notification =>
      const AssetGenImage('assets/images/notification.png');
  AssetGenImage get nurse => const AssetGenImage('assets/images/nurse.png');
  AssetGenImage get nurseWoman =>
      const AssetGenImage('assets/images/nurse_woman.png');
  AssetGenImage get officeBuilding =>
      const AssetGenImage('assets/images/office-building.png');
  AssetGenImage get plumber => const AssetGenImage('assets/images/plumber.png');
  AssetGenImage get sponge => const AssetGenImage('assets/images/sponge.png');
  AssetGenImage get star => const AssetGenImage('assets/images/star.png');
  AssetGenImage get worker => const AssetGenImage('assets/images/worker.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName)
      : _assetName = assetName,
        super(assetName);
  final String _assetName;

  Image image({
    Key key,
    ImageFrameBuilder frameBuilder,
    ImageLoadingBuilder loadingBuilder,
    ImageErrorWidgetBuilder errorBuilder,
    String semanticLabel,
    bool excludeFromSemantics = false,
    double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => _assetName;
}

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/auth
  $AssetsIconsAuthGen get auth => const $AssetsIconsAuthGen();

  /// Directory path: assets/icons/flags
  $AssetsIconsFlagsGen get flags => const $AssetsIconsFlagsGen();

  /// Directory path: assets/icons/global
  $AssetsIconsGlobalGen get global => const $AssetsIconsGlobalGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/shapes
  $AssetsImagesShapesGen get shapes => const $AssetsImagesShapesGen();

  /// Directory path: assets/images/user
  $AssetsImagesUserGen get user => const $AssetsImagesUserGen();
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// Directory path: assets/logos/auth
  $AssetsLogosAuthGen get auth => const $AssetsLogosAuthGen();

  /// File path: assets/logos/facebook-icon.png
  AssetGenImage get facebookIcon =>
      const AssetGenImage('assets/logos/facebook-icon.png');

  /// File path: assets/logos/google-icon.png
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/logos/google-icon.png');

  /// Directory path: assets/logos/home
  $AssetsLogosHomeGen get home => const $AssetsLogosHomeGen();

  /// Directory path: assets/logos/profile
  $AssetsLogosProfileGen get profile => const $AssetsLogosProfileGen();

  /// List of all assets
  List<AssetGenImage> get values => [facebookIcon, googleIcon];
}

class $AssetsIconsAuthGen {
  const $AssetsIconsAuthGen();

  /// File path: assets/icons/auth/bxs_mobile.svg
  String get bxsMobile => 'assets/icons/auth/bxs_mobile.svg';

  /// List of all assets
  List<String> get values => [bxsMobile];
}

class $AssetsIconsFlagsGen {
  const $AssetsIconsFlagsGen();

  /// File path: assets/icons/flags/egypt.png
  AssetGenImage get egypt =>
      const AssetGenImage('assets/icons/flags/egypt.png');

  /// File path: assets/icons/flags/jordan.png
  AssetGenImage get jordan =>
      const AssetGenImage('assets/icons/flags/jordan.png');

  /// File path: assets/icons/flags/lebanon.png
  AssetGenImage get lebanon =>
      const AssetGenImage('assets/icons/flags/lebanon.png');

  /// File path: assets/icons/flags/qatar.png
  AssetGenImage get qatar =>
      const AssetGenImage('assets/icons/flags/qatar.png');

  /// File path: assets/icons/flags/saudi_arabia.png
  AssetGenImage get saudiArabia =>
      const AssetGenImage('assets/icons/flags/saudi_arabia.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [egypt, jordan, lebanon, qatar, saudiArabia];
}

class $AssetsIconsGlobalGen {
  const $AssetsIconsGlobalGen();

  /// File path: assets/icons/global/Combined-Shape.svg
  String get combinedShape => 'assets/icons/global/Combined-Shape.svg';

  /// File path: assets/icons/global/Group (1).svg
  String get group1 => 'assets/icons/global/Group (1).svg';

  /// File path: assets/icons/global/Group 97.svg
  String get group97 => 'assets/icons/global/Group 97.svg';

  /// File path: assets/icons/global/Group.svg
  String get group => 'assets/icons/global/Group.svg';

  /// File path: assets/icons/global/Vector.svg
  String get vector => 'assets/icons/global/Vector.svg';

  /// List of all assets
  List<String> get values => [combinedShape, group1, group97, group, vector];
}

class $AssetsImagesShapesGen {
  const $AssetsImagesShapesGen();

  /// File path: assets/images/shapes/Group.svg
  String get group => 'assets/images/shapes/Group.svg';

  /// List of all assets
  List<String> get values => [group];
}

class $AssetsImagesUserGen {
  const $AssetsImagesUserGen();

  /// File path: assets/images/user/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [user];
}

class $AssetsLogosAuthGen {
  const $AssetsLogosAuthGen();

  /// File path: assets/logos/auth/lock.svg
  String get lock => 'assets/logos/auth/lock.svg';

  /// File path: assets/logos/auth/noun-login.svg
  String get nounLogin => 'assets/logos/auth/noun-login.svg';

  /// List of all assets
  List<String> get values => [lock, nounLogin];
}

class $AssetsLogosHomeGen {
  const $AssetsLogosHomeGen();

  /// File path: assets/logos/home/money.svg
  String get money => 'assets/logos/home/money.svg';

  /// List of all assets
  List<String> get values => [money];
}

class $AssetsLogosProfileGen {
  const $AssetsLogosProfileGen();

  /// File path: assets/logos/profile/material-symbols_person.svg
  String get materialSymbolsPerson =>
      'assets/logos/profile/material-symbols_person.svg';

  /// List of all assets
  List<String> get values => [materialSymbolsPerson];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

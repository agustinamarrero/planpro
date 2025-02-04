import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantelpro_ui/src/generated/assets.gen.dart';

abstract class PLANPROIcon {
  ///Returns the back icon
  SvgPicture backIcon({double? size, Color? color}) {
    return Assets.icons.backIcon.svg(
      color: color,
      height: size ?? 14,
      width: size ?? 14,
    );
  }

  ///Returns the email outline icon
  SvgPicture emailOutline({double? size, Color? color}) {
    return Assets.icons.emailOutline.svg(
      color: color,
      height: size ?? 14,
      width: size ?? 14,
    );
  }

  ///Returns the email outline icon
  SvgPicture logo({double? size, Color? color}) {
    return Assets.icons.logo.svg(
      color: color,
      height: size ?? 14,
      width: size ?? 14,
    );
  }
}

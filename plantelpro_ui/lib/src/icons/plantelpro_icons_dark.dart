import 'package:plantelpro_ui/plantelpro_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PLANPROIconsDark extends PLANPROIcon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? PLANPROColors.white,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? PLANPROColors.white,
      size: size ?? 14,
    );
  }
}
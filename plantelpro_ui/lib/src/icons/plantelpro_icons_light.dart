import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPROIconsLight extends PLANPROIcon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? PLANPROColors.black,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? PLANPROColors.black,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture logo({double? size, Color? color}) {
    return super.logo(
      color: color ?? PLANPROColors.black,
      size: size ?? 14,
    );
  }
}

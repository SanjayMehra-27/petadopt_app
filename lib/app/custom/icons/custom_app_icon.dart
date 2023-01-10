import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppIcon {
  static String basePath = 'assets/icons/';

  static Widget get saerchIcon => SvgPicture.asset('${basePath}search_icon.svg',
      semanticsLabel: 'search icon', color: Colors.black);
}

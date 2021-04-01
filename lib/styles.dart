import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const Color gold = Color.fromRGBO(216, 171, 76, 1);

  static const TextStyle textRowPlaceholder = TextStyle(
      color: CupertinoColors.systemGrey,
      fontWeight: FontWeight.bold,
      fontSize: 20
  );

  static const TextStyle textRow = TextStyle(
      color: CupertinoColors.black,
      fontSize: 20
  );
}
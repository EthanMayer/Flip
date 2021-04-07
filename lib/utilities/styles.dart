import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

/// Class to hold all of the custom styles.
abstract class Styles {
  // Official Vanderbilt gold.
  static const Color gold = Color.fromRGBO(216, 171, 76, 1);

  // Official dark Vanderbilt gold.
  static const Color darkerGold = Color.fromRGBO(153, 127, 61, 1);

  // Standardized blue used for nav bar buttons.
  static const Color systemBlue = CupertinoColors.systemBlue;

  // Standardized placeholder text style.
  static const TextStyle textRowPlaceholder = TextStyle(
      color: CupertinoColors.systemGrey,
      fontWeight: FontWeight.bold,
      fontSize: 20
  );

  // Standardized text style.
  static const TextStyle textRow = TextStyle(
      color: CupertinoColors.black,
      fontSize: 20
  );

  // Standardized button text style.
  static const TextStyle textButton = TextStyle(
      color: CupertinoColors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
  );
}
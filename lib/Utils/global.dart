import 'package:flutter/material.dart';

import '../Screens/BhagwadGitaModel/bhagwadGitaModel.dart';

List<PopupMenuEntry> popUpMenuItems = [
  const PopupMenuItem(
    value: 0,
    child: Text(
      'Sanskrit',
    ),
  ),
  const PopupMenuItem(
    value: 1,
    child: Text(
      'Hindi',
    ),
  ),
  const PopupMenuItem(
    value: 2,
    child: Text(
      'English',
    ),
  ),
  const PopupMenuItem(
    value: 3,
    child: Text(
      'Gujarati',
    ),
  ),
];
List<Verses> shloks = [];
List<Verses> shlokPreviewList = [];
/*import 'package:flutter/material.dart';

class DetailScreenProvider extends ChangeNotifier {
  String selectedLanguage = 'Sanskrit';

  void languageTranslate(String value) {
    selectedLanguage = value;
    notifyListeners();
  }
}*/
String om='ऊँ श्री परमात्मने नमः';
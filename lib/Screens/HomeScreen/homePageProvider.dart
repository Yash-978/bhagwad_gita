import 'package:flutter/material.dart';
class HomePageProvider extends ChangeNotifier{
  int languageIndex=0;
  void translateLanguage()
  {
    if(languageIndex<3)
      {
        languageIndex++;
        notifyListeners();
      }
    else
      {
        notifyListeners();
        languageIndex=0;
      }
  }
}
class ThemeChangeProvider extends ChangeNotifier
{
  bool isLight=false;
  bool isColor=false;
  void changeTheme()
  {
    isLight=!isLight;
    isColor=!isColor;

    notifyListeners();
  }


}
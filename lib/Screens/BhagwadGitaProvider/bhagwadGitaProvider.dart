import 'dart:convert';

import 'package:bhagwad_gita/Screens/BhagwadGitaModel/bhagwadGitaModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BhagwadGitaProvider extends ChangeNotifier {
  List<BhagwadGitaModel> bhagwadGitaList = [];

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('assets/Json/gita.json');
    List gita = jsonDecode(json);
    bhagwadGitaList = gita
        .map(
          (e) => BhagwadGitaModel.fromJson(e),
        )
        .toList();

    notifyListeners();
  }

  BhagwadGitaProvider() {
    jsonParsing();
  }
}

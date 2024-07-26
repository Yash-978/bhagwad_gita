import 'package:bhagwad_gita/Screens/ShlokScreen/shlokProvider.dart';
import 'package:bhagwad_gita/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:provider/provider.dart';

import '../BhagwadGitaProvider/bhagwadGitaProvider.dart';
import '../HomeScreen/HomePage.dart';
import '../HomeScreen/homePageProvider.dart';

final pageFlip = GlobalKey<PageFlipWidgetState>();

class ShlokPage extends StatelessWidget {
  const ShlokPage({super.key});

  @override
  Widget build(BuildContext context) {
    BhagwadGitaProvider bhagwadGitaProvider =
        Provider.of<BhagwadGitaProvider>(context);
    HomePageProvider homePageProviderFalse =
        Provider.of<HomePageProvider>(context, listen: false);
    ShlokProvider shlokProviderFalse =
        Provider.of<ShlokProvider>(context, listen: false);
    ShlokProvider shlokProviderTrue =
        Provider.of<ShlokProvider>(context, listen: true);
    HomePageProvider homePageProviderTrue =
        Provider.of<HomePageProvider>(context, listen: true);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff320D0A),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          (shlokProviderTrue.selectedLanguage == 'Sanskrit')
              ? bhagwadGitaProvider
                  .bhagwadGitaList[selectedIndex].chapterName.chSanskrit
              : (shlokProviderTrue.selectedLanguage == 'Hindi')
                  ? bhagwadGitaProvider
                      .bhagwadGitaList[selectedIndex].chapterName.chHindi
                  : (shlokProviderTrue.selectedLanguage == 'English')
                      ? bhagwadGitaProvider
                          .bhagwadGitaList[selectedIndex].chapterName.chEnglish
                      : bhagwadGitaProvider.bhagwadGitaList[selectedIndex]
                          .chapterName.chGujarati,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          DropdownButton(
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            dropdownColor: Color(0xff320D0A),
            value: shlokProviderTrue.selectedLanguage,
            items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ));
            }).toList(),
            onChanged: (String? value) {
              shlokProviderFalse.languageTranslate(value!);
            },
          )
        ],
      ),
      body: Container(
        height: h * 1,
        width: w * 1,
        decoration: BoxDecoration(
          // color: Colors.red
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bhagwadGita.jpg'),
          ),
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: shloks.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    selectedPreviewIndex = index;
                    shlokPreviewList = bhagwadGitaProvider
                        .bhagwadGitaList[selectedIndex].verses;
                    Navigator.of(context).pushNamed('/shlokPreview');
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: h * 0.3,
                    width: w * 0.85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                      child: SelectableText(
                        (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                            ? bhagwadGitaProvider.bhagwadGitaList[selectedIndex]
                                .verses[index].language.sanskrit
                            : (shlokProviderTrue.selectedLanguage == 'Hindi')
                                ? bhagwadGitaProvider
                                    .bhagwadGitaList[selectedIndex]
                                    .verses[index]
                                    .language
                                    .hindi
                                : (shlokProviderTrue.selectedLanguage ==
                                        'English')
                                    ? bhagwadGitaProvider
                                        .bhagwadGitaList[selectedIndex]
                                        .verses[index]
                                        .language
                                        .english
                                    : bhagwadGitaProvider
                                        .bhagwadGitaList[selectedIndex]
                                        .verses[index]
                                        .language
                                        .gujarati,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int selectedPreviewIndex = 0;

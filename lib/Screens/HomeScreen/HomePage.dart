import 'package:bhagwad_gita/Screens/BhagwadGitaProvider/bhagwadGitaProvider.dart';
import 'package:bhagwad_gita/Screens/HomeScreen/homePageProvider.dart';
import 'package:bhagwad_gita/Screens/ShlokScreen/shlokProvider.dart';
import 'package:bhagwad_gita/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List translate = [
  'अध्यायः',
  'अध्याय',
  'Chapter',
  'પ્રકરણ',
];

int selectedIndex = 0;

// late BhagwadGitaProvider bhagwadGitaProvider;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // get languageIndex=null;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    ThemeChangeProvider themeChangeProviderTrue =
        Provider.of(context, listen: true);
    ThemeChangeProvider themeChangeProviderFalse =
        Provider.of(context, listen: false);

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff320D0A),
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 30),
          //   child: Switch(
          //     value: themeChangeProviderTrue.isLight,
          //     onChanged: (value) {
          //       themeChangeProviderFalse.changeTheme();
          //     },
          //   ),
          // ),
          centerTitle: true,
          scrolledUnderElevation: 0.1,
          title: Text(
            (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                ? translate[0]
                : (shlokProviderTrue.selectedLanguage == 'Hindi')
                    ? translate[1]
                    : (shlokProviderTrue.selectedLanguage == 'English')
                        ? translate[2]
                        : translate[3],
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
              Text(
                'ऊँ श्री परमात्मने नमः',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: bhagwadGitaProvider.bhagwadGitaList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      shloks = bhagwadGitaProvider
                          .bhagwadGitaList[selectedIndex].verses;
                      Navigator.of(context).pushNamed('/shlok');
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: h * 0.1,
                      width: w * 0.95,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: h * 0.25,
                            width: w * 0.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/sbgnum-removebg-preview.png'))),
                            child: Text(
                              bhagwadGitaProvider.bhagwadGitaList[index].chapter
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white,//Color(0xffCB9056),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: w*0.7,
                            child: Text(
                              (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                                  ? bhagwadGitaProvider.bhagwadGitaList[index]
                                      .chapterName.chSanskrit
                                  : (shlokProviderTrue.selectedLanguage ==
                                          'Hindi')
                                      ? bhagwadGitaProvider.bhagwadGitaList[index]
                                          .chapterName.chHindi
                                      : (shlokProviderTrue.selectedLanguage ==
                                              'English')
                                          ? bhagwadGitaProvider
                                              .bhagwadGitaList[index]
                                              .chapterName
                                              .chEnglish
                                          : bhagwadGitaProvider
                                              .bhagwadGitaList[index]
                                              .chapterName
                                              .chGujarati,
                              style: const TextStyle(overflow: TextOverflow.clip,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        // ListView.builder(
        //   itemCount: bhagwadGitaProvider.bhagwadGitaList.length,
        //   itemBuilder: (context, index) => ListTile(
        //     leading: Text(bhagwadGitaProvider
        //         .bhagwadGitaList[index].chapterName.chSanskrit),
        //     subtitle: Text(bhagwadGitaProvider
        //         .bhagwadGitaList[index].chapter
        //         .toString()),
        //     title: Text(bhagwadGitaProvider
        //         .bhagwadGitaList[index].verses[index].language.gujarati),
        //     // leading: Text(bhagwadGitaProvider
        //     //     .bhagwadGitaList[index].verses[index].language.english),
        //   ),
        // ),
        );
  }
}
// Container adhyayContainer(
//     {required double height,
//       required double width,
//       required BhagwadGitaProvider bhagwadGitaProvider,
//       required int index,
//       required HomePageProvider homePageProviderFalse,
//       required ShlokProvider shlokProviderTrue}) {
//   return Container(
//     alignment: Alignment.center,
//     margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//     padding: const EdgeInsets.all(30),
//     // height: height * 0.12,
//     width: width * 0.95,
//     decoration: BoxDecoration(
//       color: color1,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Text(
//       (shlokProviderTrue.selectedLanguage == 'Sanskrit')
//           ? BhagwadGitaProvider.bhagwadGitaList[index].chapterName.sanskrit
//           : (detailScreenProviderTrue.selectedLanguage == 'Hindi')
//           ? gitaProvider.gitaModalList[index].chapterName.hindi
//           : (detailScreenProviderTrue.selectedLanguage == 'English')
//           ? gitaProvider
//           .gitaModalList[index].chapterName.english
//           : gitaProvider
//           .gitaModalList[index].chapterName.gujarati,
//       style: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 25,
//       ),
//     ),
//   );
// }
// }

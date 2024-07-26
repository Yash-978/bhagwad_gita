import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bhagwad_gita/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:page_flip/page_flip.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import 'BhagwadGitaProvider/bhagwadGitaProvider.dart';
import 'HomeScreen/HomePage.dart';
import 'HomeScreen/homePageProvider.dart';
import 'ShlokScreen/ShlokPage.dart';
import 'ShlokScreen/shlokProvider.dart';

PageView pageView = PageView();
GlobalKey repaintKey = GlobalKey();

class ShlokPreviewPage extends StatelessWidget {
  const ShlokPreviewPage({super.key});

  get index => null;

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
                        ? bhagwadGitaProvider.bhagwadGitaList[selectedIndex]
                            .chapterName.chEnglish
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
        body: PageView.builder(
          itemCount: 1,
          controller: pageView.controller,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Container(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                      ? bhagwadGitaProvider
                          .bhagwadGitaList[selectedPreviewIndex]
                          .chapterName
                          .chSanskrit
                      : (shlokProviderTrue.selectedLanguage == 'Hindi')
                          ? bhagwadGitaProvider
                              .bhagwadGitaList[selectedPreviewIndex]
                              .chapterName
                              .chHindi
                          : (shlokProviderTrue.selectedLanguage == 'English')
                              ? bhagwadGitaProvider
                                  .bhagwadGitaList[selectedPreviewIndex]
                                  .chapterName
                                  .chEnglish
                              : bhagwadGitaProvider
                                  .bhagwadGitaList[selectedPreviewIndex]
                                  .chapterName
                                  .chGujarati,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                SelectableText(
                  (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                      ? bhagwadGitaProvider.bhagwadGitaList[selectedIndex]
                          .verses[selectedPreviewIndex].language.sanskrit
                      : (shlokProviderTrue.selectedLanguage == 'Hindi')
                          ? bhagwadGitaProvider.bhagwadGitaList[selectedIndex]
                              .verses[selectedPreviewIndex].language.hindi
                          : (shlokProviderTrue.selectedLanguage == 'English')
                              ? bhagwadGitaProvider
                                  .bhagwadGitaList[selectedIndex]
                                  .verses[selectedPreviewIndex]
                                  .language
                                  .english
                              : bhagwadGitaProvider
                                  .bhagwadGitaList[selectedIndex]
                                  .verses[selectedPreviewIndex]
                                  .language
                                  .gujarati,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     IconButton(
                //       onPressed: () async {
                //         RenderRepaintBoundary boundary = repaintKey.currentContext!
                //             .findRenderObject() as RenderRepaintBoundary;
                //
                //         ui.Image image = await boundary.toImage();
                //         ByteData? byteData =
                //             await image.toByteData(format: ui.ImageByteFormat.png);
                //
                //         Uint8List img = byteData!.buffer.asUint8List();
                //
                //         final imgPath = await getApplicationDocumentsDirectory();
                //         final file = File("${imgPath.path}/img.png");
                //
                //         file.writeAsBytes(img);
                //         ShareExtend.share(file.path, 'image');
                //       },
                //       icon: const Icon(
                //         Icons.share,
                //         color: Colors.black,
                //         size: 30,
                //       ),
                //     ),
                //     IconButton(
                //       onPressed: () async {
                //         RenderRepaintBoundary boundary = repaintKey.currentContext!
                //             .findRenderObject() as RenderRepaintBoundary;
                //
                //         ui.Image image = await boundary.toImage();
                //
                //         ByteData? byteData =
                //             await image.toByteData(format: ui.ImageByteFormat.png);
                //
                //         Uint8List img = byteData!.buffer.asUint8List();
                //
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           const SnackBar(
                //             behavior: SnackBarBehavior.floating,
                //             margin: EdgeInsets.all(10),
                //             content: Text('Saved to the gallery!'),
                //           ),
                //         );
                //
                //         ImageGallerySaver.saveImage(img);
                //       },
                //       icon: const Icon(
                //         Icons.save_alt,
                //         color: Colors.white,
                //         size: 30,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}

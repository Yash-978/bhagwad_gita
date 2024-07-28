import 'package:bhagwad_gita/Screens/BhagwadGitaProvider/bhagwadGitaProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/HomeScreen/HomePage.dart';
import 'Screens/HomeScreen/homePageProvider.dart';
import 'Screens/ShlokScreen/ShlokPage.dart';
import 'Screens/ShlokScreen/shlokProvider.dart';
import 'Screens/SplashScreen/SplashPage.dart';
import 'Screens/shlokPreview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BhagwadGitaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShlokProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeChangeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.light(),
        // darkTheme: ThemeData.dark(),
        // themeMode: ThemeMode.system,
        initialRoute: '/splash',
        routes: {
          '/': (context) => HomePage(),
          '/shlok': (context) => ShlokPage(),
          '/shlokPreview': (context) => ShlokPreviewPage(),
          '/splash': (context) => SplashPage(),
        },
      ),
    );
  }
}

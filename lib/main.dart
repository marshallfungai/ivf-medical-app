import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global.dart';
import '../ui/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: MyApp.list,
    useOnlyLangCode: true,
    fallbackLocale: const Locale('en', 'UK'),
    startLocale: const Locale('tr', 'TR'),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static const list = [
    Locale('en', 'UK'),
    Locale('tr', 'TR'),
  ];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _checkIsFirstSeen;
  var _checkStoredLocale;
  var _locale;
  var windowLocale;
  //windowLocale  = ui.window.locale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIsFirstSeen = SharedPreferencesStorage.checkSharedPreference("seen")
        .then((value) => value);
    _checkStoredLocale =
        SharedPreferencesStorage.checkSharedPreference("locale");
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyprus IVF Center',
      themeMode: ThemeMode.dark,
      onGenerateTitle: (context) => tr('app_name'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //app-specific locatization
        EasyLocalization.of(context)!.delegate
      ],
      supportedLocales: EasyLocalization.of(context)!.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        //textTheme: GoogleFonts.latoTextTheme(textTheme),
        textTheme: GoogleFonts.openSansTextTheme().copyWith(
          button: TextStyle(color: Colors.white),
        ),
      ),
      home: FutureBuilder<String?>(
          future: SharedPreferencesStorage.getSharedPreferenceString("locale"),
          builder: (context, snapshot) {
            var lang = snapshot.data == null ? ui.window.locale : snapshot.data;
            // SharedPreferencesStorage.setSharedPreference('string', "locale", lang);
            //setLocale(context, lang);

            return FutureBuilder(
              future: _checkIsFirstSeen,
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == true)
                    return LoginScreen();
                  else
                    SharedPreferencesStorage.setSharedPreference(
                        'bool', "seen", true);
                  return OnBoardingScreen();
                } else {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }),
      routes: {
        'home': (ctx) => HomeScreen(),
        'auth': (ctx) => LoginScreen(),
        'settings': (ctx) => SettingsScreen(),
        'aboutUs': (ctx) => AboutUsScreen(),
      },
    );
  }

  void setLocale(context, lang) {
    print("its here $lang");
    context.locale = Locale(lang);
  }
}

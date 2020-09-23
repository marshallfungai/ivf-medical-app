import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_appointment/global.dart';
import 'package:medical_appointment/ui/screens/screens.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    path: 'assets/translations',
    supportedLocales: MyApp.list,
    useOnlyLangCode: true,
    fallbackLocale: Locale('en', 'UK'),
    startLocale: Locale('tr', 'TR'),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIsFirstSeen = SharedPreferencesStorage.checkSharedPreference("seen").then((value) => value);
    _checkStoredLocale = SharedPreferencesStorage.checkSharedPreference("locale").then((value) => value);
//     _locale =  _checkStoredLocale ? SharedPreferencesStorage.getSharedPreference('string','locale') : '';
//
//     print('_checkIsFirstSeen');
//     print(_checkStoredLocale);
//     windowLocale  = ui.window.locale;
    // windowLocale  = true ? SharedPreferencesStorage.getSharedPreference("String","locale").then((value) => value) : ui.window.locale;
    //_locale = load(windowLocale);

  }


//  Future load(Locale locale) async {
//    try {
//
//      final first = MyApp.list ?.firstWhere( (l) => l?.languageCode == windowLocale?.languageCode);
//      locale = first != null ? first : Locale('en', 'UK');
//
//    } catch (e) {
//      print(e);
//      print('Its err here {$e}');
//    }
//
////    return locale;
//  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyprus IVF Center',
      themeMode: ThemeMode.dark,
      onGenerateTitle: (context)=>tr('app_name'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //app-specific locatization
        EasyLocalization.of(context).delegate
      ],
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.openSansTextTheme().copyWith(
          button: TextStyle(color: Colors.white),
        ),
      ),
      home:  FutureBuilder(
              future: _checkIsFirstSeen,
              builder: (ctx, snapshot) {
                if(snapshot.hasData){
                  if(snapshot.data)
                    return LoginScreen();
                  else
                    SharedPreferencesStorage.setSharedPreference('bool', "seen", true);
                    return OnBoardingScreen();
                }
                else {
                  return Scaffold( body: Center(child: CircularProgressIndicator(),),);
                }
              },
     ),
      routes: {
        'home':(ctx) => HomeScreen(),
        'auth':(ctx) => LoginScreen(),
      },
    );
  }
}



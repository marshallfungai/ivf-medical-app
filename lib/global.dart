import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

//Shared Preferences functions
class SharedPreferencesStorage {
  static Future<bool> checkSharedPreference(s_key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(s_key)) {
      return true;
    }

    return false;
  }

  static Future<bool> setSharedPreference(s_type, s_key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    s_key = s_key.toLowerCase();

    switch (s_type) {
      case 'int':
        prefs.setInt(s_key, value);
        break;
      case 'string':
        prefs.setString(s_key, value);
        break;
      case 'bool':
        prefs.setBool(s_key, value);
        break;
      default:
        return false;
    }

    return true;
  }

  static Future getSharedPreference(type, key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    key = key.toLowerCase();

    switch (type) {
      case 'int':
        prefs.getInt(key);
        break;
      case 'string':
        prefs.getString(key);
        break;
      case 'bool':
        prefs.getBool(key);
        break;
      default:
        return false;
    }

    return true;
  }

  static Future<String?> getSharedPreferenceString(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }
}

class OnBoardingInstructions {
  final String image, title, subtitle;

  OnBoardingInstructions(this.image, this.title, this.subtitle);
}

class MyColors {
  static const grey = Color(0xfff3f3f3),
      orange = Color(0xffffb755),
      red = Color(0xffed5568),
      lightGreen = Color(0xffdbf3e8),
      darkGreen = Color(0xff4ac18e),
      blue = Color(0xff40beee),
      navyBlue = Color(0xff484186),
      pink = Color(0xffe9008c);
}

class DoctorInfo {
  final String name,
      image,
      type,
      reviewCount,
      about,
      workingHours,
      patientsCount,
      experience,
      certifications;

  final double reviews;

  DoctorInfo({
    required this.name,
    required this.image,
    required this.type,
    required this.reviews,
    required this.reviewCount,
    required this.about,
    required this.workingHours,
    required this.patientsCount,
    required this.experience,
    required this.certifications,
  });
}

class PageName {
  final String name;

  PageName({
    required this.name,
  });
}

List<DoctorInfo> doctorInfo = [
  DoctorInfo(
    image:
        "https://image.freepik.com/vecteurs-libre/contexte-du-docteur_1270-84.jpg",
    about:
        "Dr. Sevket Alpturk, is the Institute Director of Dogus IVF CENTER. The Infertility clinic was established by Dr. Sevket ALPTÜRK in 1992.",
    certifications: "10",
    experience: "15",
    name: "Dr. Sevket Alpturk,",
    patientsCount: "385",
    reviewCount: "1320",
    reviews: 4.3,
    type: "Gynecologist and Infertility IVF Specialist",
    workingHours: "Mon - Fri 09:00 - 17:00",
  ),
  DoctorInfo(
    image:
        "https://image.freepik.com/vecteurs-libre/contexte-du-docteur_1270-84.jpg",
    about:
        "Incidunt placeat eos magni quas quam in dignissimos. Asperiores porro distinctio nemo excepturi labore?",
    certifications: "10",
    experience: "15",
    name: "Jin. Op.Dr.Şevket ALPTÜRK",
    patientsCount: "385",
    reviewCount: "1320",
    reviews: 4.3,
    type: "Gynecologist and IVF Specialist",
    workingHours: "Mon - Fri 09:00 - 17:00",
  ),
  DoctorInfo(
    image:
        "https://image.freepik.com/vecteurs-libre/contexte-du-docteur_1270-84.jpg",
    about:
        "Incidunt placeat eos magni quas quam in dignissimos. Asperiores porro distinctio nemo excepturi labore?",
    certifications: "10",
    experience: "15",
    name: "Dr. Çağatay Çelik",
    patientsCount: "385",
    reviewCount: "1320",
    reviews: 4.3,
    type: "Anesthesia Specialist",
    workingHours: "Mon - Fri 09:00 - 17:00",
  ),
];

List<OnBoardingInstructions> onBoardingInstructions = [
  OnBoardingInstructions(
    "assets/images/onboarding2.png",
    tr('s_onboarding_title_1'),
    "Incidunt placeat eos magni quas quam in dignissimos. Asperiores porro distinctio nemo excepturi labore?",
  ),
  OnBoardingInstructions(
    "assets/images/onboarding3.png",
    tr('s_onboarding_title_2'),
    "Incidunt placeat eos magni quas quam in dignissimos. Asperiores porro distinctio nemo excepturi labore?",
  ),
];

List<Map<String, dynamic>> categories = [
  {
    'icon': 'assets/icons/ivf.png',
    'title': tr("s_intro_vitrolization"),
    'color': MyColors.red,
    'desc':
        'Yumurta donasyonu önceleri erken menapoza giren genç kadınları anne yapmaya yönelik bir yöntemdi daha sonraları yıllarca çocuk özlemi çeken anne adayları için çözüm umudu haline geldi. Ayrıca yumurta donasyonu erken yumurta yetmezliği, yumurta kalitesizliği, başarısız tüp bebek denemeleri, kemoterapi veya radyoterapi sonrası yaşanan yumurta yetmezliğinde ve menapozda olan hastaların başvurdukları bir tüp bebek tedavisidir. Yumurta donasyonu Kıbrıs Tüp Bebek Merkezimizde başarı ile uygulanmaktadır.',
  },
  {
    'icon': 'assets/icons/egg-donation.png',
    'title': tr("s_egg_donation"),
    'color': MyColors.orange,
    'desc':
        'Yumurta donasyonu önceleri erken menapoza giren genç kadınları anne yapmaya yönelik bir yöntemdi daha sonraları yıllarca çocuk özlemi çeken anne adayları için çözüm umudu haline geldi. Ayrıca yumurta donasyonu erken yumurta yetmezliği, yumurta kalitesizliği, başarısız tüp bebek denemeleri, kemoterapi veya radyoterapi sonrası yaşanan yumurta yetmezliğinde ve menapozda olan hastaların başvurdukları bir tüp bebek tedavisidir. Yumurta donasyonu Kıbrıs Tüp Bebek Merkezimizde başarı ile uygulanmaktadır.',
  },
  {
    'icon': 'assets/icons/sperm.png',
    'title': tr("s_sperm_donation"),
    'color': MyColors.navyBlue,
    'desc':
        'Yumurta donasyonu önceleri erken menapoza giren genç kadınları anne yapmaya yönelik bir yöntemdi daha sonraları yıllarca çocuk özlemi çeken anne adayları için çözüm umudu haline geldi. Ayrıca yumurta donasyonu erken yumurta yetmezliği, yumurta kalitesizliği, başarısız tüp bebek denemeleri, kemoterapi veya radyoterapi sonrası yaşanan yumurta yetmezliğinde ve menapozda olan hastaların başvurdukları bir tüp bebek tedavisidir. Yumurta donasyonu Kıbrıs Tüp Bebek Merkezimizde başarı ile uygulanmaktadır.',
  },
];

String avatar =
    "https://image.freepik.com/free-photo/indoor-shot-happy-young-woman-with-glasses-posing-against-white-wall_273609-20361.jpg";
String hospitalLogo = "assets/images/dogus-ivf-logo.png";
String mainOffice =
    "https://image.freepik.com/free-photo/office-skyscrapers-business-district_107420-95733.jpg";
String treatmentsBG =
    "https://image.freepik.com/free-photo/physician-noting-down-symptoms-patient_53876-63308.jpg";

List<Map<String, dynamic>> aboutUsPages = [
  {'pageName': 'dogus ', 'title': tr("s_sperm_donation")},
  {
    'pageName': 'intro_Vitrolization',
    'title': tr("Intro-Vitrolization"),
  },
  {'pageName': 'egg_donation', 'title': tr("s_egg_donation")}
];

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingInstructions {
  final String image, title,subtitle;

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
    this.name,
    this.image,
    this.type,
    this.reviews,
    this.reviewCount,
    this.about,
    this.workingHours,
    this.patientsCount,
    this.experience,
    this.certifications,
  });
}

class PageName {
  final String name;

  PageName({
    this.name,
  });
}

List<DoctorInfo> doctorInfo = [
  DoctorInfo(
    image:"https://image.freepik.com/vecteurs-libre/contexte-du-docteur_1270-84.jpg",
    about: "Dr. Sevket Alpturk, is the Institute Director of Dogus IVF CENTER. The Infertility clinic was established by Dr. Sevket ALPTÜRK in 1992.",
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
    image: "https://image.freepik.com/vecteurs-libre/contexte-du-docteur_1270-84.jpg",
    about: "Incidunt placeat eos magni quas quam in dignissimos. Asperiores porro distinctio nemo excepturi labore?",
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
    image: "https://image.freepik.com/vecteurs-libre/contexte-du-docteur_1270-84.jpg",
    about: "Incidunt placeat eos magni quas quam in dignissimos. Asperiores porro distinctio nemo excepturi labore?",
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
    "Conquer Infertility",
    "Incidunt placeat eos magni quas quam in dignissimos. Asperiores porro distinctio nemo excepturi labore?",
  ),
  OnBoardingInstructions(
    "assets/images/onboarding3.png",
    "We have a record of high success rates",
    "Incidunt placeat eos magni quas quam in dignissimos. Asperiores porro distinctio nemo excepturi labore?",
  ),
];

List<Map<String, dynamic>> categories = [
  {
    'icon': 'assets/icons/ivf.png',
    'title': tr("s_intro_vitrolization"),
    'color': MyColors.red,
    'desc': 'Yumurta donasyonu önceleri erken menapoza giren genç kadınları anne yapmaya yönelik bir yöntemdi daha sonraları yıllarca çocuk özlemi çeken anne adayları için çözüm umudu haline geldi. Ayrıca yumurta donasyonu erken yumurta yetmezliği, yumurta kalitesizliği, başarısız tüp bebek denemeleri, kemoterapi veya radyoterapi sonrası yaşanan yumurta yetmezliğinde ve menapozda olan hastaların başvurdukları bir tüp bebek tedavisidir. Yumurta donasyonu Kıbrıs Tüp Bebek Merkezimizde başarı ile uygulanmaktadır.',
  },
  {
    'icon': 'assets/icons/egg-donation.png',
    'title': tr("s_egg_donation"),
    'color': MyColors.orange,
    'desc': 'Yumurta donasyonu önceleri erken menapoza giren genç kadınları anne yapmaya yönelik bir yöntemdi daha sonraları yıllarca çocuk özlemi çeken anne adayları için çözüm umudu haline geldi. Ayrıca yumurta donasyonu erken yumurta yetmezliği, yumurta kalitesizliği, başarısız tüp bebek denemeleri, kemoterapi veya radyoterapi sonrası yaşanan yumurta yetmezliğinde ve menapozda olan hastaların başvurdukları bir tüp bebek tedavisidir. Yumurta donasyonu Kıbrıs Tüp Bebek Merkezimizde başarı ile uygulanmaktadır.',
  },
  {
    'icon': 'assets/icons/sperm.png',
    'title': tr("s_sperm_donation"),
    'color': MyColors.navyBlue,
    'desc': 'Yumurta donasyonu önceleri erken menapoza giren genç kadınları anne yapmaya yönelik bir yöntemdi daha sonraları yıllarca çocuk özlemi çeken anne adayları için çözüm umudu haline geldi. Ayrıca yumurta donasyonu erken yumurta yetmezliği, yumurta kalitesizliği, başarısız tüp bebek denemeleri, kemoterapi veya radyoterapi sonrası yaşanan yumurta yetmezliğinde ve menapozda olan hastaların başvurdukları bir tüp bebek tedavisidir. Yumurta donasyonu Kıbrıs Tüp Bebek Merkezimizde başarı ile uygulanmaktadır.',
  },
];

String avatar = "https://pbs.twimg.com/profile_images/1233356631188082689/qcmTohZh_400x400.jpg";
String hospitalLogo = "assets/images/dogus-ivf-logo.png";


List<Map<String, dynamic>> aboutUsPages = [
  {
    'pageName': 'dogus ',
    'title': tr("s_sperm_donation")
  },
  {
    'pageName': 'assets/icons/ivf.png',
    'title': tr("Intro-Vitrolization"),
  },
  {
    'pageName': 'assets/icons/ivf.png',
    'title': tr("s_egg_donation")
  }
];
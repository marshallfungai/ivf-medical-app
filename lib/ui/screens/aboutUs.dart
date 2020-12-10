import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medical_appointment/global.dart';
import 'package:medical_appointment/ui/widgets/widgets.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(hasBackButton: true),
        drawer: SideDrawer(),
        body: Center(
          child: Container(
            child: Text('About us page'),
          ),
        ),
      ),
    );
  }
}

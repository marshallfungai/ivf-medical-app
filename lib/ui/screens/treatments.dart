import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medical_appointment/global.dart';
import 'package:medical_appointment/ui/widgets/widgets.dart';

class TreatmentsScreen extends StatefulWidget {
  @override
  _TreatmentsScreenState createState() => _TreatmentsScreenState();
}

class _TreatmentsScreenState extends State<TreatmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(hasBackButton: true),
        drawer: SideDrawer(),
        body: Center(
          child: Container(
            child: Text('Treatments page'),
          ),
        ),
      ),
    );
  }
}


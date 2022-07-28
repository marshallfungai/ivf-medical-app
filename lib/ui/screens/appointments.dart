import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/sideDrawer.dart';

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(hasBackButton: false),
        drawer: SideDrawer(),
        body: Center(
          child: Container(
            child: Text('Appointments page'),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_appointment/global.dart';
import 'package:medical_appointment/ui/screens/screens.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3 ,
            child: DrawerHeader(
                decoration: BoxDecoration(
                //  color: Colors.pinkAccent,
                  gradient: LinearGradient(colors: <Color>[
                    Colors.pinkAccent,
                    Colors.pink,
                    Color(0xffe9008c)
                  ])
                ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle ,
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile-user.jpg'),
                          fit: BoxFit.cover
                      ),
                    ),
                    // child: Text('Drawer Header')
                  ),
                  Text('Mrs Veronica Mars',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('patient@email.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),

            ),
          ),
          ListTile(
            leading: Icon(Icons.business_center),
            title: Text('Hakkimizda'),
            subtitle: Text('We value your happiness',
              style: TextStyle(
                //color: Colors.grey,

              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            subtitle: Text('Stay Connected',
              style: TextStyle(
                //color: Colors.grey,

              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Appointments'),
            subtitle: Text('See the future',
              style: TextStyle(
                //color: Colors.grey,

              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Treatments'),
            subtitle: Text('The best doctors to serve you',
              style: TextStyle(
                //color: Colors.grey,

              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            subtitle: Text('Control your app',
              style: TextStyle(
                //color: Colors.grey,

              ),
            ),
            onTap:  () => Navigator.push( context, MaterialPageRoute(builder: (context) => SettingsScreen(), ), ),
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Logout'),
            onTap: () {
              // Update the state of the app.
              // ...

              Navigator.push( context, MaterialPageRoute(builder: (context) => LoginScreen(), ), );
            },
          ),
        ],
      ),
    );
  }
}




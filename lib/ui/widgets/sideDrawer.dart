import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_appointment/global.dart';
import 'package:medical_appointment/ui/screens/profileScreen.dart';
import 'package:medical_appointment/ui/screens/screens.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {

  String user_email ='jenniffer@gmail.com';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: SharedPreferencesStorage.getSharedPreferenceString( 'user_email'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          var userEmail = snapshot.data;
          List<Widget> children;
          if (snapshot.hasData) {
            return Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen() ) );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4 ,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          //  color: Colors.pinkAccent,
                            gradient: LinearGradient(colors: <Color>[
                              Colors.pinkAccent,
                              Colors.pink,
                              Color(0xffe9008c)
                            ])
                        ),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle ,
                                    image: DecorationImage(
                                        image: NetworkImage("$avatar"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                  // child: Text('Drawer Header')
                                ),
                                Text('Zehra',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text( userEmail,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_work_outlined),
                    title: Text('Ana Sayfa'),
                    subtitle: Text('Everything you need ',
                      style: TextStyle(
                        //color: Colors.grey,

                      ),
                    ),
                      onTap:  () => Navigator.push( context, MaterialPageRoute(builder: (context) => HomeScreen(), ), ),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_hospital),
                    title: Text(tr('s_treatments_menu')),
                    subtitle: Text('The best doctors to serve you',
                      style: TextStyle(
                        //color: Colors.grey,

                      ),
                    ),
                      onTap:  () => Navigator.push( context, MaterialPageRoute(builder: (context) => TreatmentsScreen(), ), ),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(tr('s_appointments_menu')),
                    subtitle: Text('See the future',
                      style: TextStyle(
                        //color: Colors.grey,

                      ),
                    ),
                    onTap:  () => Navigator.push( context, MaterialPageRoute(builder: (context) => AppointmentsScreen(), ), ),
                  ),
                  ListTile(
                    leading: Icon(Icons.business_center),
                    title: Text(tr('s_about_us_menu')),
                    subtitle: Text('We value your happiness',
                      style: TextStyle(
                        //color: Colors.grey,

                      ),
                    ),
                      onTap:  () => Navigator.push( context, MaterialPageRoute(builder: (context) => AboutUsScreen(), ), ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(tr('s_settings_menu')),
                    subtitle: Text('Control your app',
                      style: TextStyle(
                        //color: Colors.grey,

                      ),
                    ),
                    onTap:  () => Navigator.push( context, MaterialPageRoute(builder: (context) => SettingsScreen(), ), ),
                  ),
                  ListTile(
                    leading: Icon(Icons.power_settings_new),
                    title: Text(tr('s_logout_menu')),
                    onTap: () {
                      // Update the state of the app.
                      // ...

                      Navigator.push( context, MaterialPageRoute(builder: (context) => LoginScreen(), ), );
                    },
                  ),

                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(

            );
          } else {
              return SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              );
          }
        },
      ),
    );
  }

  /*Widget build(BuildContext context) {

    SharedPreferencesStorage.getSharedPreference('string', 'user_email').then((value) => setState(()=>this.user_email = value));

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4 ,
            child: DrawerHeader(
                decoration: BoxDecoration(
                //  color: Colors.pinkAccent,
                  gradient: LinearGradient(colors: <Color>[
                    Colors.pinkAccent,
                    Colors.pink,
                    Color(0xffe9008c)
                  ])
                ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
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
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text( user_email,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              ),

            ),
          ),
          ListTile(
            leading: Icon(Icons.business_center),
            title: Text(tr('s_about_us_menu')),
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
            title: Text(tr('s_messages_menu')),
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
            title: Text(tr('s_appointments_menu')),
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
            title: Text(tr('s_treatments_menu')),
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
            title: Text(tr('s_settings_menu')),
            subtitle: Text('Control your app',
              style: TextStyle(
                //color: Colors.grey,

              ),
            ),
            onTap:  () => Navigator.push( context, MaterialPageRoute(builder: (context) => SettingsScreen(), ), ),
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text(tr('s_logout_menu')),
            onTap: () {
              // Update the state of the app.
              // ...

              Navigator.push( context, MaterialPageRoute(builder: (context) => LoginScreen(), ), );
            },
          ),
        ],
      ),
    );
  }*/
}




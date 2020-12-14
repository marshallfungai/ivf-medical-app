import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medical_appointment/ui/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List <MenuItem> menuItems = [
    MenuItem(
        "Notfications",
        Icon(CommunityMaterialIcons.bell)
    ),
    MenuItem(
        "Privacy Settings",
        Icon(CommunityMaterialIcons.incognito)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Language'),
            value: true,
            onChanged: (bool value) {
              setState(() {

              });
            },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
          Column(
            children: menuItems.map((element) {
              return ListTile(
                leading: element.icon,
                title: Text(element.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MenuItem {
  String title;
  var icon;

  MenuItem(
      this.title,
      this.icon
      );
}

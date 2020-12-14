import 'package:flutter/material.dart';
import 'package:medical_appointment/ui/screens/profileScreen.dart';

import '../../global.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  bool hasBackButton = false;
  
  MainAppBar({this.hasBackButton = false});
  @override
  _MainAppBarState createState() => _MainAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
  
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: MyColors.pink.withOpacity(.6),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: widget.hasBackButton? Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ): Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black54,
          ),
          onPressed: (){ print('pressed'); Scaffold.of(context).openDrawer();},
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen() ) );
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage("$avatar"),
              //backgroundImage: ImageIcon(),
            ),
          ),
        )
      ],
    );
  }
}

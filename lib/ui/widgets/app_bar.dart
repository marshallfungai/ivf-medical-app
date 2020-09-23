import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  bool hasBackButton = false;
  
  MainAppBar({this.hasBackButton});
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

      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medical_appointment/global.dart';
import 'package:medical_appointment/ui/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  bool _showMoreAbout = true;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(),
        drawer: SideDrawer(),
        body: LayoutBuilder(
            builder: (context, _)=> Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: MediaQuery.of(context).size.height * .35,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$mainOffice'),
                        fit: BoxFit.fill,
                      ),
                    ),

                  ),
                ),
                Positioned.fill(
                  child: DraggableScrollableSheet(
                    initialChildSize: 2 / 3,
                    minChildSize: 2 / 3,
                    maxChildSize: 1,
                    builder: (context, scrollController) => Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.only(
                        //   topRight: Radius.circular(15.0),
                        //   topLeft: Radius.circular(15.0),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: Offset(0, -3),
                            blurRadius: 5.0,
                          )
                        ],
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Kibris IVF ",
                                      style: Theme.of(context).textTheme.headline4,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: MyColors.orange,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                decoration: BoxDecoration(
                                  color: MyColors.darkGreen,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _makePhoneCall('tel: +90 54 000 000 000');
                                  },
                                ),
                              ),
                            ],
                          ),
                          Text(
                            tr('about_us'),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: 15),
                          Wrap(
                            children: <Widget>[
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                maxLines: _showMoreAbout ? null : 1,
                              ),
                              FlatButton(
                                child: Text(
                                  _showMoreAbout ? "See Less" : "See More",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: MyColors.blue),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showMoreAbout = !_showMoreAbout;
                                  });
                                },
                              )
                            ],
                          ),
                          Text(
                            tr('s_working_hours'),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Row(
                            children: <Widget>[
                              Text("07:15 - 18:00"),
                              SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Text(
                                    tr('s_open_btn'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .copyWith(color: MyColors.darkGreen),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Color(0xffdbf3e8),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),

                          SizedBox(height: 15),
                          Text(
                            tr('s_stats'),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          SizedBox(height: 11),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

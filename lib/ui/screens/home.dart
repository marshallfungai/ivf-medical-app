import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medical_appointment/global.dart';
import 'package:medical_appointment/ui/screens/screens.dart';
import 'package:medical_appointment/ui/widgets/widgets.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(hasBackButton: false),
        drawer: SideDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tr('welcome_to'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(color: Colors.grey, fontSize: 20),
                              ),
                              Text(
                                tr('app_name'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent, fontSize: 25),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 9),
//                  TextField(
//                    decoration: InputDecoration(
//                      prefixIcon: Icon(Icons.search),
//                      hintText: "Search",
//                      filled: true,
//                      fillColor: MyColors.grey,
//                      border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(5.0),
//                        borderSide: BorderSide.none,
//                      ),
//                    ),
//                  ),
                    SizedBox(height: 9),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      child: GestureDetector(
                        onTap: () => {},
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  "https://image.freepik.com/free-vector/doctor-concept-illustration_114360-1269.jpg",
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                padding: const EdgeInsets.all(11.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: MyColors.pink.withOpacity(.6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      tr('s_why_choose_us'),
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17 ),
                                    ),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                      color: MyColors.navyBlue,
                                      child: Text(
                                        tr('s_home_find_out_more_btn'),
                                        style: Theme.of(context).textTheme.button,
                                      ),
                                      onPressed: () => Navigator.push( context, MaterialPageRoute(builder: (context) => AboutUsScreen(), ), ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 9),
                    Text(tr('s_categories'), style: Theme.of(context).textTheme.headline6),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 9.0),
                      height: 71,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                           categories.length,
                           (f) => GestureDetector(
                            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> TreatmentDetailScreen(id: f))),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width / 2.5
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 9.0),
                              padding: const EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: MyColors.grey),
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: categories[f]['color'],
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Image.asset("${categories[f]['icon']}"),
                                  ),
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text("${categories[f]['title']}"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                  color: MyColors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          tr("top_doctors"),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        FlatButton(
                          child: Text(tr('see_all')),
                          onPressed: () {},
                        )
                      ],
                    ),
                    ListView.builder(
                      itemCount: doctorInfo.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) => DoctorContainer(id: i),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

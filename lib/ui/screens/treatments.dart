import 'package:flutter/material.dart';

import '../../global.dart';
import '../widgets/appBar.dart';
import '../widgets/sideDrawer.dart';
import '../widgets/treamentsListContainer.dart';

class TreatmentsScreen extends StatefulWidget {
  @override
  _TreatmentsScreenState createState() => _TreatmentsScreenState();
}

class _TreatmentsScreenState extends State<TreatmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(),
        drawer: SideDrawer(),
        body: LayoutBuilder(
            builder: (context, _) => Stack(
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
                            image: NetworkImage('$treatmentsBG'),
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
                          child: ListView.builder(
                            itemCount: doctorInfo.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) =>
                                TreatmentsListContainer(id: i),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}

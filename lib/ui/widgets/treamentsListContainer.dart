import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medical_appointment/global.dart';
import 'package:medical_appointment/ui/screens/screens.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TreatmentsListContainer extends StatelessWidget {
  final int id;
  const TreatmentsListContainer({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var treatment = categories[id];

    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> TreatmentDetailScreen(id: id))),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 3)
        ], color: Colors.white, borderRadius: BorderRadius.circular(9.0)),
        margin: const EdgeInsets.all(9.0),
        padding: const EdgeInsets.all(9.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 51,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: treatment['color'],
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: Image.asset("${treatment['icon']}"),
              ),
            ),
            SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${treatment['title']}",
                      style: Theme.of(context).textTheme.subtitle2),
                  Text(
                    "${treatment['desc']}",
                      maxLines: 2,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: SmoothStarRating(
                          rating: doctorInfo[id].reviews,
                          size: 15,
                          color: MyColors.orange,
                        ),
                      ),
                      Text("(${doctorInfo[id].reviewCount})"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 9),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: MyColors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Icon(Icons.bookmark_border),
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      tr('s_make_an_appointment'),
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
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:medical_appointment/global.dart';

class OnBoardingScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(onPressed: () => Navigator.pushReplacementNamed(context, 'auth'), child: Text(tr('s_onboarding_skip'))),
              ),
              Expanded(
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: onBoardingInstructions.length,
                      itemBuilder: (ctx, i) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Image.asset("${onBoardingInstructions[i].image}"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onBoardingInstructions.length,
                                  (f) => Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  shape:
                                  f == i ? BoxShape.rectangle : BoxShape.circle,
                                  color: f == i ? Colors.blueAccent : Colors.grey,
                                  borderRadius:
                                  f == i ? BorderRadius.circular(5.0) : null,
                                ),
                                width: f == i ? 15 : 5,
                                height: 5,
                              ),
                            ),
                          ),
                          SizedBox(height: 11.0),
                          Text(
                            "${onBoardingInstructions[i].title}",
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "${onBoardingInstructions[i].subtitle}",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                  )
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: MyColors.pink,
                    child: Text(
                      tr('s_onboarding_next'),
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {
                      if(onBoardingInstructions.length - 1 == _pageController.page) {
                        Navigator.pushReplacementNamed(context, 'auth');
                      }
                      else {
                        _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeIn);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

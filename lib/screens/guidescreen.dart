import 'package:cmafinal_app/widgets/guidewidgets.dart';
import 'package:flutter/material.dart';
import 'package:cmafinal_app/widgets/shapedwidgets.dart';
import 'package:cmafinal_app/widgets/cmabottombar.dart';
import 'package:cmafinal_app/assets/constants.dart';
import 'package:cmafinal_app/widgets/clipshadow.dart';


class GuidesScreen extends StatefulWidget {
  @override
  _GuidesScreenState createState() => _GuidesScreenState();
}
int choice = 1;
class _GuidesScreenState extends State<GuidesScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height*0.39,
              child: Stack(
                children: [
                  Positioned(
                    top: size.height / 5.0,
                    left: 8,
                    child: ClipShadow(
                      clipper: GuideClipperL(20.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 3.0,
                          spreadRadius: 5.0,
                          color: Colors.black54,
                        )
                      ],
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            choice = 2;
                          });
                          print(choice);
                        },
                        child: Container(
                          height: size.height * 0.15,
                          // la custom shape est oblique à 75%
                          width: size.width / 3.5,
                          color: choice != 2 ? kMasterRedColor : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Déroulement'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: choice != 2 ? Colors.white : kMasterRedColor,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 7.70,
                    left: 8,
                    child: ClipShadow(
                      clipper: GuideClipperL(20.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 3.0,
                          spreadRadius: 5.0,
                          color: Colors.black54,
                        )
                      ],
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            choice = 1;
                          });
                          print(choice);
                        },
                        child: Container(
                          height: size.height * 0.12,
                          width: size.width / 3.5,
                          color: choice != 1 ? kMasterRedColor : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Les contrôles'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: choice != 1 ? Colors.white : kMasterRedColor,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 5.0,
                    left: size.height * 0.19,
                    child: ClipShadow(
                      clipper: GuideClipperC(20.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 3.0,
                          spreadRadius: 5.0,
                          color: Colors.black54,
                        )
                      ],
                      child: RawMaterialButton(
                        onPressed: () {setState(() {
                          choice = 3;
                        });
                        print(choice);},
                        child: Container(
                          height: size.height * 0.15,
                          // la custom shape est oblique à 75%
                          width: size.width / 3.5,
                          color: choice != 3 ? kMasterRedColor : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Droits et devoirs'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: choice != 3 ? Colors.white : kMasterRedColor,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 8.35,
                    left: size.height * 0.19,
                    child: ClipShadow(
                      clipper: GuideClipperC(20.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 3.0,
                          spreadRadius: 5.0,
                          color: Colors.black54,
                        )
                      ],
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            choice = 4;
                          });
                        },
                        child: Container(
                          height: size.height * 0.12,
                          // la custom shape est oblique à 75%
                          width: size.width / 3.5,
                          color: choice != 4 ? kMasterRedColor : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('La localisation'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: choice != 4 ? Colors.white : kMasterRedColor,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 5,
                    left: size.height * 0.365,
                    child: ClipShadow(
                      clipper: GuideClipperR(20.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 3.0,
                          spreadRadius: 5.0,
                          color: Colors.black54,
                        )
                      ],
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            choice = 6;
                          });
                        },
                        child: Container(
                          height: size.height * 0.165,
                          // la custom shape est oblique à 75%
                          width: size.width / 3.5,
                          color: choice != 6 ? kMasterRedColor : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Les compléments alimentaires'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: choice != 6 ? Colors.white : kMasterRedColor,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 9.2,
                    left: size.height * 0.365,
                    child: ClipShadow(
                      clipper: GuideClipperR(20.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 3.0,
                          spreadRadius: 5.0,
                          color: Colors.black54,
                        )
                      ],
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            choice = 5;
                          });
                        },
                        child: Container(
                          height: size.height * 0.15,
                          // la custom shape est oblique à 75%
                          width: size.width / 3.5,
                          color: choice != 5 ? kMasterRedColor : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Les AUT'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: choice != 5 ? Colors.white : kMasterRedColor,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  TopBarWidget(onPress: () {
                    Navigator.pop(
                        context);
                  }, label1: 'le', label2: 'guide de', label3: 'l\'antidopage',),
                ],
              ),
            ),
            getGuides(choice),
            // AnimatedSizeAndFade(
            //   vsync: this,
            //   child : getGuides(choice),
            //   fadeDuration: const Duration(milliseconds: 300),
            //   sizeDuration: const Duration(milliseconds: 100),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: CmaBottomBar(),
    );
  }
}



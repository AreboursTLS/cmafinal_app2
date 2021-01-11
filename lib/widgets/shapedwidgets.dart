import 'package:cmafinal_app/assets/constants.dart';
import 'package:cmafinal_app/screens/contactscreen.dart';
import 'package:flutter/material.dart';
import 'package:cmafinal_app/widgets/clipshadow.dart';




//boutons de la page d'accueil
class HomeWidget extends StatelessWidget {
  HomeWidget ({@required this.colour,@required this.text, @required this.prop, @required this.n, @required this.textColour, @required this.onPress});
  final Color colour; //couleur du bouton
  final  String text; //text du bouton
  final double prop; //nombre de boutons pour connaître la taille en fonction de l'écran du device
  final double n; //position dans le Stack
  final Color textColour;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Positioned(
      top : n,
      child:
      ClipShadow(
        clipper: HomeClipper(20.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 8),
            blurRadius: 3.0,
            spreadRadius: 5.0,
            color: Colors.black54,
          )
        ],
        child: RawMaterialButton(
          onPressed: onPress,
          child: Container(
            height: size.height / prop * 1.25, // la custom shape est oblique à 75%
            width : size.width,
            color : colour,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(text.toUpperCase(),
                    style: TextStyle(

                      fontSize: 16.0,
                      color: textColour,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeBottomWidget extends StatelessWidget {
  HomeBottomWidget ({@required this.colour,@required this.text, @required this.prop, @required this.n, @required this.textColour});
  final Color colour; //couleur du bouton
  final  String text; //text du bouton
  final double prop; //nombre de boutons pour connaître la taille en fonction de l'écran du device
  final double n; //position dans le Stack
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Positioned(
      top : n,
      child:
      ClipPath (
        clipper: BackgroundClipper(),
        child: RawMaterialButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactScreen()),
            );
          },
          child: Container(
            height: size.height / prop * 1.25, // la custom shape est oblique à 75%
            width : size.width,
            color : colour,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(text.toUpperCase(),
                      style: TextStyle(

                        fontSize: 16.0,
                        color: textColour,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 5,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBarWidget extends StatelessWidget {
final Function onPress;
final String label1;
final String label2;
final String label3;
TopBarWidget({this.onPress, this.label1, this.label2, this.label3});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return ClipShadow (
      clipper: HomeClipper(200),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 8),
          blurRadius: 5.0,
          spreadRadius: 3.0,
          color: Colors.black54,
        )
      ],
      child: Container(
        height: size.height / 7,
        width : size.width,
        color : kMasterWhiteColor,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left : 12.0),
              child: RawMaterialButton(
                onPressed: onPress,
                child: Image(
                  image: AssetImage('images/herculesrouge.png'),
                  width: 75,
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height : 15 ,
                ),
                Text(label1.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: kHomeButtonTextStyleBlack),
                Text(label2.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: kHomeButtonTextStyleBlack,),
                Text(label3.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: kHomeButtonTextStyleBlack,),
              ],
            ),
            SizedBox(
              width: 10,
            ),],
        ),
      ),
    );
  }
}

// custom shape
class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // forme trapèze
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HomeClipper extends CustomClipper<Path> {
  HomeClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// ombre de la custom shape
class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);

    canvas.drawShadow(path, Colors.black, 1.5, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class BackgroundClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // forme trapèze
    path.lineTo(0, size.height *0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BoxShadowPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes
    path.lineTo(0, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);

    canvas.drawShadow(path, Colors.black, 1.5, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


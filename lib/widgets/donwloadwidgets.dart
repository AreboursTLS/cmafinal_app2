import 'package:flutter/material.dart';
import 'package:cmafinal_app/widgets/clipshadow.dart';
import 'package:cmafinal_app/widgets/shapedwidgets.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> launched;

Future<void> launchInApp(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Erreur de connexion';
  }
}

Future<void> makePhoneCall(String url) async{
  if(await canLaunch(url)){
    await launch(url); }
    else {
      throw 'Erreur lors de l\'appel';
  }
  }

class DownloadWidget extends StatelessWidget {
  DownloadWidget ({@required this.text, @required this.prop, @required this.n, @required this.url});
  final  String text; //text du bouton
  final double prop; //nombre de boutons pour connaître la taille en fonction de l'écran du device
  final double n; //position dans le Stack
  final String url;

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
          onPressed: (){
            launchInApp(url);
          },
          child: Container(
            height: size.height / prop * 1.25, // la custom shape est oblique à 75%
            width : size.width,
            color : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width*0.80,
                    child: Text(text.toUpperCase(),
                        style: TextStyle(

                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        )),
                  ),
                SizedBox(
                  width: 10.0,
                ),
                  IconButton(
                  icon: Icon(FontAwesomeIcons.download),
                    onPressed: (){},
                )],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class BottomDownloadWidget extends StatelessWidget {
  BottomDownloadWidget ({@required this.text, @required this.prop, @required this.n, @required this.url});
  final  String text; //text du bouton
  final double prop; //nombre de boutons pour connaître la taille en fonction de l'écran du device
  final double n;
  final String url;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Positioned(
      top : n,
      child:
      RawMaterialButton(
        onPressed: (){
          launchInApp(url);
        },
        child: Container(
          height: size.height / prop * 1.25, // la custom shape est oblique à 75%
          width : size.width,
          color : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width*0.80,
                  child: Text(text.toUpperCase(),
                      style: TextStyle(

                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 3,
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.download),
                  onPressed: (){},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
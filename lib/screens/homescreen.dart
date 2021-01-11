import 'package:cmafinal_app/screens/documentsutiles.dart';
import 'package:cmafinal_app/screens/contactscreen.dart';
import 'package:cmafinal_app/screens/educationscreen.dart';
import 'package:cmafinal_app/screens/newsscreen.dart';
import 'package:flutter/material.dart';
import 'package:cmafinal_app/widgets/shapedwidgets.dart';
import 'package:cmafinal_app/assets/constants.dart';
import 'package:cmafinal_app/screens/medicamentsscreen.dart';
import 'package:cmafinal_app/screens/videosscreen.dart';
import 'package:cmafinal_app/screens/newsscreen2.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double startingSize = size.height /7*0.75;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          color: Colors.white,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              HomeBottomWidget(colour: Colors.white, text:'Contacter le Comité', prop: 7, n: startingSize*7.75, textColour: Colors.black,  ),
              HomeWidget(colour: kMasterRedColor, text:'éducation', prop: 7, n:startingSize*6, textColour: Colors.white, onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EducationScreen()),
                );
              },),
              HomeWidget(colour: kMasterWhiteColor, text:'Vidéos', prop: 7, n: startingSize*4.75, textColour: Colors.black, onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideosScreen()),
                );
              },),
              HomeWidget(colour: kMasterRedColor, text:'Documents utiles', prop: 7, n:startingSize*3.50, textColour: Colors.white, onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentsUtilesScreen()),
                );
              }, ),
              HomeWidget(colour: kMasterWhiteColor, text:'Testez vos médicaments', prop: 7, n: startingSize*2.25, textColour: Colors.black, onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicamentsScreen()),
                );
              },),
              HomeWidget(onPress: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsScreen2())
              );},
                colour: kMasterRedColor, text:'Actualités du comité', prop: 7, n: startingSize, textColour: Colors.white,),
              TopBarWidget(onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home())
                );
              }, label1: 'comité', label2: 'monégasque', label3: 'antidopage', ),


            ],
          ),
        ),
      ),
    );
  }
}

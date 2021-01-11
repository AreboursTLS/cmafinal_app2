import 'package:cmafinal_app/screens/contactscreen.dart';
import 'package:cmafinal_app/screens/documentsutiles.dart';
import 'package:cmafinal_app/screens/educationscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cmafinal_app/screens/homescreen.dart';
import 'package:cmafinal_app/screens/medicamentsscreen.dart';
import 'package:cmafinal_app/screens/contactscreen.dart';

class CmaBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.07,
      color: Colors.grey.shade900,
      child: Row(
        children: [
          Container(
            width: size.width / 7,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(FontAwesomeIcons.home,
                size: 30.0,
                color: Colors.white,),
            ),
          ),
          Container(
            width: size.width / 7,
            child: IconButton(
              icon: Icon(FontAwesomeIcons.newspaper,
                size: 30.0,
                color: Colors.white,),
            ),
          ),
          Container(
            width: size.width / 7,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicamentsScreen()),
                );
              },
              icon: Icon(FontAwesomeIcons.medkit,
                size: 30.0,
                color: Colors.white,),
            ),
          ),
          Container(
            width: size.width / 7,
            child: IconButton(
              icon : Icon(FontAwesomeIcons.university,
                size: 30.0,
                color: Colors.white,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentsUtilesScreen()),
                );
              },
            ),),
          Container(
            width: size.width / 7,
            child: IconButton(
              onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EducationScreen()),
              );},
              icon : Icon(FontAwesomeIcons.graduationCap,
                size: 30.0,
                color: Colors.white,),),
          ),
          Container(
            width: size.width / 7,
            child: IconButton(
              icon: Icon(FontAwesomeIcons.video,
                size: 30.0,
                color: Colors.white,),),
          ),
          Container(
            width: size.width / 7,
            child: IconButton(
              onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactScreen()),
              );},
              icon : Icon(FontAwesomeIcons.phone,
                size: 30.0,

                color: Colors.white,),),
          ),
        ],
      ),
    );
  }
}
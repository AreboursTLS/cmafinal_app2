
import 'package:flutter/material.dart';
import 'package:cmafinal_app/widgets/shapedwidgets.dart';
import 'package:cmafinal_app/widgets/cmabottombar.dart';
import 'package:cmafinal_app/screens/homescreen.dart';
import 'package:cmafinal_app/widgets/educationwidgets.dart';
import 'package:cmafinal_app/screens/guidescreen.dart';

class EducationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double startingSize = size.height /7*0.75;
    return Scaffold(
      bottomNavigationBar: CmaBottomBar(),
      body: SafeArea(
        child: Container(
          height: size.height,
          color: Colors.white,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              OpenEducURLWidget(url:'https://adel.wada-ama.org/learn', n:startingSize*4, prop: 7, text: 'ADEL',),
              OpenEducURLWidget(url: 'https://docs.google.com/forms/u/0/?tgif=d', n:startingSize*2.50, prop: 7, text: 'Questionnaires',),
              OpenEducPagedWidget(onPressed:(){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GuidesScreen()),
              );} , n:startingSize*1.1, prop: 7, text: 'Le guide de l\'antidopage',),
              TopBarWidget(onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home())
                );
              }, label1: 'Les', label2: 'documents', label3: 'utiles', ),


            ],
          ),
        ),
      ),
    );
  }
}
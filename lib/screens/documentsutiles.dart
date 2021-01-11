
import 'package:flutter/material.dart';
import 'package:cmafinal_app/widgets/shapedwidgets.dart';
import 'package:cmafinal_app/widgets/cmabottombar.dart';
import 'package:cmafinal_app/widgets/donwloadwidgets.dart';
import 'package:cmafinal_app/screens/homescreen.dart';

class DocumentsUtilesScreen extends StatelessWidget {

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
              BottomDownloadWidget(url: 'https://onad-monaco.mc/wp-content/uploads/2015/09/WADA-2015-ISPPPI-Final-FR.pdf', n:startingSize*7.3, prop: 10, text: 'Le Standard International pour la protection des renseignements personnels',),
              DownloadWidget(url: 'https://onad-monaco.mc/wp-content/uploads/2015/09/2021_isrm_0.pdf', n:startingSize * 6.16, prop: 10, text: 'Le Standard International pour la gestion des resultats',),
              DownloadWidget(url: 'https://www.wada-ama.org/sites/default/files/resources/files/wada-isti-jan_2017-fr_final.pdf', n:startingSize*5.15, prop: 10, text: 'Le Standard International pour les contrôles et enquêtes',),
              DownloadWidget(url: 'https://onad-monaco.mc/wp-content/uploads/2015/09/Programme-de-surveillance-2020-AMA.pdf', n:startingSize*4.14, prop: 10, text: 'Programme de surveillance de l\'AMA',),
              DownloadWidget(url:'https://onad-monaco.mc/wp-content/uploads/2015/09/wada_2020_intedictions_fr.pdf', n:startingSize*3.13, prop: 10, text: 'Liste des interdictions de l\'AMA',),
              DownloadWidget(url: 'https://onad-monaco.mc/wp-content/uploads/2015/09/Formulaire-de-demande-dAUT.pdf', n:startingSize*2.12, prop: 10, text: 'Formulaire d\'AUT',),
              DownloadWidget(url : 'https://onad-monaco.mc/wp-content/uploads/2015/09/wada_anti-doping_code_2017_french_revised_v8_linked.pdf', n:startingSize*1.1, prop: 10, text: 'Code Mondial Antidopage',),
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
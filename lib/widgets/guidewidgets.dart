import'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cmafinal_app/widgets/clipshadow.dart';

Widget getGuides(int choice) {
  if (choice == 1) {
    return ControleGuide();
  } else if (choice == 2) {
    return DeroulementGuide();
  } else if (choice == 3){
    return DroitsGuide();}
  else if (choice == 4){
    return LocalisationGuide();}
  else if (choice == 5){
    return AutGuide();}
  else {
    return ComplementsGuide();}
}

class ControleGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AutoSizeText('Les contrôles'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
        Row(
          children: [
            Container(
              width: size.width*0.60,
              child: Image(
                image: AssetImage('images/docteur1.png'),
              ),

            ),
            ClipShadow(
              clipper: ControlesGuideClipper(100),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  color: Colors.black54,
                )
              ],
              child: Container(
                width: size.width *0.32,
                color: Color(0xFF29486b),
                child: Padding(
                  padding: const EdgeInsets.only(left : 8.0, top: 10, right: 8, bottom: 30,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText('Où est quand ?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      AutoSizeText('En compétition et hors compétition, de 6 h à 23 h',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      AutoSizeText('Qui réalise les contrôles ?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      AutoSizeText('Des agents de contrôle du dopage (ACD) formés, assermentés et agréés',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      AutoSizeText('Quels types de prélèvements sont effectués ?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      AutoSizeText('Urine ou sang et autres matrices',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DeroulementGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                AutoSizeText('La procédure de contrôle urinaire et sanguin du dopage'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Image(
                    image: AssetImage('images/docteur2.png'),
                    width: size.width * 0.50,
                    height: size.height*0.42,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),

          SizedBox(
            child: ClipShadow(
              clipper: DeroulementGuideClipper(100),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  color: Colors.black54,
                )
              ],
              child: SizedBox(
                width: size.width * 0.33,
                height: size.height*0.48,
                child: Container(
                  color: Color(0xFF29486b),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left : 8.0, right: 8.0, bottom: 35,),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/notif.png'),
                              height: 80,
                              width: 80,
                            ),
                            AutoSizeText(
                              'Notification du sportif'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style : TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/labo2.png'),
                              height: 80,
                              width: 100,
                            ),
                            AutoSizeText(
                              'Accueil au poste de contrôle'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style : TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/kitprelevement.png'),
                              height: 80,
                              width: 100,
                            ),
                            AutoSizeText(
                              "Choix d'un kit de prélévement".toUpperCase(),
                              textAlign: TextAlign.center,
                              style : TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/prelevement.png'),
                              height: 90,
                              width: 90,
                            ),
                            AutoSizeText(
                              'Prélévement sanguin ou observation de la miction par un ACD du même sexe'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style : TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/echantillon.png'),
                              height: 70,
                              width: 100,
                            ),
                            AutoSizeText(
                              'Répartition des échantillons'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style : TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/signature2.png'),
                              height: 100,
                              width: 100,
                            ),
                            AutoSizeText(
                              'Signature et éventuelles observations'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style : TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),



                      ],),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}

class DroitsGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.50,
      width: size.width,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            height: size.height * 0.43,
            width: size.width*0.40,
            left: size.width*0.30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                ),
                AutoSizeText('Vos'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF29486b),
                    )),
                AutoSizeText('droits'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF29486b),
                    )),
                Image(
                  image: AssetImage('images/droits.png'),
                ),
                AutoSizeText('Vos'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD94104),
                      letterSpacing: -1.5,
                    )),
                AutoSizeText('responsabilités'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD94104),
                      letterSpacing: -0.30,
                    )),
              ],
            ),
          ),// panneau gauche
          SizedBox(
            width: size.width*0.33,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipShadow(
                  clipper: DroitsGuideClipperL(100),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 3.0,
                      spreadRadius: 3.0,
                      color: Colors.black54,
                    )
                  ],
                  child: Container(
                    color: Color(0xFF29486b),
                    child: Padding(
                      padding: const EdgeInsets.only(left : 8.0, right: 8.0, top: 10.0, bottom: 30.0),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 10,),
                          AutoSizeText('ÊTRE ACCOMPAGNÉ PAR UN REPRÉSENTANT ET/OU UN INTERPRÈTE SI NÉCESSAIRE'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),),
                          SizedBox(
                            height: 10,),
                          AutoSizeText('DEMANDER UN DÉLAI AVANT LE CONTRÔLE EN ET HORS COMPÉTITION'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),),
                          SizedBox(
                            height: 10,),
                          AutoSizeText('NOTER SUR LE FORMULAIRE VOS OBSERVATIONS ÉVENTUELLES SUR LE DÉROULEMENT DU CONTRÔLE'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),),
                          SizedBox(
                            height: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),// centre
          Positioned(
            right: 0,
            child: SizedBox(
              width: size.width*0.33,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipShadow(
                  clipper: DroitsGuideClipperR(100),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-5, 5),
                      blurRadius: 3.0,
                      spreadRadius: 3.0,
                      color: Colors.black54,
                    )
                  ],
                  child: Container(
                    color: Color(0xFFD94104),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,),
                          AutoSizeText("VOUS SOUMETTRE AU CONTRÔLE ANTIDOPAGE JUSQU'À LA FIN DE LA PROCÉDURE".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),),
                          SizedBox(
                            height: 10,),
                          AutoSizeText("PRÉSENTER UNE PIÈCE D'IDENTITÉ APPROPRIÉE".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                            ),),
                          SizedBox(
                            height: 10,),
                          AutoSizeText("DEMEURER EN PRÉSENCE DE L'ESCORTE OU DE L'AGENT DE CONTRÔLE DU DOPAGE EN TOUT TEMPS".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                            ),),
                          SizedBox(
                            height: 25,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),// panneau droit

        ],
      ),
    );
  }
}

class LocalisationGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText('La Localisation'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: size.height * 0.11,
            width: size.width*0.95,
            child: ClipShadow(
              clipper: LocalisationClipperView(100),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  color: Colors.black54,
                )
              ],
              child: SizedBox(
                child: Container(
                  color: Color(0xFF29486b),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left : 30.0, right: 8.0, bottom: 10.0,),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          width: size.width*0.80,
                          height: size.height * 0.09,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "POUR LES SPORTIFS INSCRITS DANS LE  GROUPE CIBLE, IL EST IMPORTANT DE RENSEIGNER SEs SINFORMATIONS DE LOCALISATION DANS LES DÉLAIS".toUpperCase(),
                                textAlign: TextAlign.center,
                                style : TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 320,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "DEUX TYPES DE MANQUEMENTS : ABSENCE DE TRANSMISSION D’INFORMATIONS OU INFORMATIONS INSUFFISAMMENT PRÉCISES.LE CONTRÔLE MANQUÉ («NO SHOW»)".toUpperCase(),
                                textAlign: TextAlign.center,
                                style : TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 320,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "ATTENTION 3 MANQUEMENTS SUR 12 MOIS ENTRAÎNENT LA VIOLATION Présumée des règles antidopage et l'ouverture d'une procédure disciplinaire".toUpperCase(),
                                textAlign: TextAlign.center,
                                style : TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 15,
                        ),
                      ],),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width*0.90,
          height: size.height * 0.325,
          child: Stack(
            fit: StackFit.loose,
            children:[
              Positioned(
                left: -40,
                bottom: -40,
                child: Image(
                  image: AssetImage('images/terre.png'),
                  width: size.width*0.75,
                ),
              ),
              Positioned(
                bottom: 3,
                right: 5,
                child: SizedBox(
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: ClipShadow(
                        clipper: LocalisationClipper(100),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5, 5),
                            blurRadius: 3.0,
                            spreadRadius: 3.0,
                            color: Colors.black54,
                          )
                        ],
                        child: Container(
                          color: Color(0xFF29486b),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  "SOUMETTRE".toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style : TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                AutoSizeText(
                                  "chacun de ses trimestres au complet (avant le 15 du mois précedent le trimestre).",
                                  textAlign: TextAlign.justify,
                                  style : TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                AutoSizeText(
                                  "Modifier".toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style : TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                AutoSizeText(
                                  "sa localisation dès qu'un changement de colendrier opère.",
                                  textAlign: TextAlign.justify,
                                  style : TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],),
        ),
      ],

    );
  }
}

class AutGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText('LES AUTORISATIONS À DES FINS THÉRAPEUTIQUES (AUT)'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: size.height * 0.12,
            width: size.width*0.95,
            child: ClipShadow(
              clipper: LocalisationClipperView(100),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  color: Colors.black54,
                )
              ],
              child: Container(
                color: Color(0xFF29486b),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left : 30.0, right: 30.0, bottom: 10.0,),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        width: size.width*0.80,
                        height: size.height * 0.12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "SI VOUS DEVEZ SUIVRE UN TRAITEMENT MÉDICAL CONTENANT UNE OU PLUSIEURS SUBSTANCES INTERDITES, IL FAUT FAIRE UNE DEMANDE D'AUT".toUpperCase(),
                              textAlign: TextAlign.center,
                              style : TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: size.width*0.80,
                        height: size.height * 0.10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "LA DEMANDE COMPLÈTE D'AUT DOIT ÊTRE SIGNÉE PAR LE SPORTIF ET LE MÉDECIN ET ENVOYÉE LE PLUS RAPIDEMENT POSSIBLE AVANT LE DÉBUT DE LA COMPÉTITION".toUpperCase(),
                              textAlign: TextAlign.center,
                              style : TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 15,
                      ),
                    ],),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width*0.90,
          height: size.height * 0.292,
          child: Stack(
            fit: StackFit.loose,
            children:[
              Positioned(
                right: 0,
                bottom: 0,
                child: Image(
                  image: AssetImage('images/docteur3.png'),
                  width: 220,
                ),
              ),
              Positioned(
                left: 0.0,
                top: 0,
                height: size.height*0.30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ClipShadow(
                      clipper: AutClipper(100),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 3.0,
                          spreadRadius: 3.0,
                          color: Colors.black54,
                        )
                      ],
                      child: Container(
                        width: size.width*0.28,
                        color: Color(0xFF29486b),
                        child: Padding(
                          padding: const EdgeInsets.only(top : 10.0, bottom: 20.0, left: 8.0, right: 8.0,),
                          child: ListView(
                            children: [
                              AutoSizeText(
                                "PRÉCISER".toUpperCase(),
                                textAlign: TextAlign.left,
                                style : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              AutoSizeText(
                                "au professionnel de santé que l'on est sportif et soumis aux règles",
                                textAlign: TextAlign.justify,
                                style : TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              AutoSizeText(
                                "CONSULTER".toUpperCase(),
                                textAlign: TextAlign.left,
                                style : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              AutoSizeText(
                                "un professionnel de santé avant de se procurer sois même des médicaments",
                                textAlign: TextAlign.justify,
                                style : TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              AutoSizeText(
                                "VÉRIFIER".toUpperCase(),
                                textAlign: TextAlign.left,
                                style : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              AutoSizeText(
                                "tout médicament acheté en vente libre sur cette application ou sur www.onad-moaco.mc",
                                textAlign: TextAlign.justify,
                                style : TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],),
        ),
      ],

    );
  }
}

class ComplementsGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AutoSizeText('Les compléments alimentaires'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
          SizedBox(
            height: size.height*0.23,
            width: size.width,
            child: ClipShadow(
              clipper: ComplementsClipper(100),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  color: Colors.black54,
                )
              ],
              child: Container(
                color: Color(0xFF29486b),
                child: Padding(
                  padding: const EdgeInsets.only(top : 8.0, left: 8.0,  right: 8.0, bottom: 25),
                  child: ListView(
                    shrinkWrap: true,
                    children:[
                      Text("L’intérêt des compléments alimentaires pour améliorer la performance est (scientifiquement) rarement démontré. En revanche, leur usage peut être dangereux pour la santé.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Les compléments alimentaires peuvent contenir des substances interdites qui n’apparaissent pas sur l’étiquetage. Leur consommation expose le sportif au risque d’un contrôle antidopage positif et à des sanctions pour VRAD.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Il n’existe aucun label, norme ou certification qui puisse garantir à 100% qu’un produit ne contiendra pas de substances interdites. Si vous pensez avoir besoin d’un complément alimentaire le CMA vous recommande de :",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("PRENDRE conseil auprès d’un professionnel de santé expert en nutrition du sport,",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("BIEN RESPECTER, en cas de prescription, doses et durée d’utilisation,",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("VÉRIFIER que le compliment alimentaire est au minimum conforme à la norme NF 94V-001,",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("TOUJOURS REFUSER les compléments alimentaires des « amis » ou d’origine incertaine ( salles de sport , internet ....).",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("LE SPORTIF EST LE SEUL RESPONSABLE DE TOUT CE QU’IL INGÈRE",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),),),
          SizedBox(
            height: 180,
            width: 300,
            child: Container(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage('images/complements2.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class ControlesGuideClipper extends CustomClipper<Path> {
  ControlesGuideClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width*0.5, size.height*0.90);
    path.lineTo(size.width, size.height );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DeroulementGuideClipper extends CustomClipper<Path> {
  DeroulementGuideClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.width*0.85);
    path.lineTo(0, size.height*0.90);
    path.lineTo(size.width*0.5, size.height);
    path.lineTo(size.width, size.height*0.90);
    path.lineTo(size.width, 0 );
    path.lineTo(size.width*0.5, size.height*0.05);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DroitsGuideClipperL extends CustomClipper<Path> {
  DroitsGuideClipperL(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height*0.90);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DroitsGuideClipperR extends CustomClipper<Path> {
  DroitsGuideClipperR(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height*0.90);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LocalisationClipperView extends CustomClipper<Path> {
  LocalisationClipperView(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width*0.07,size.height*0.50 );
    path.lineTo(0, size.height);
    path.lineTo(size.width*0.90, size.height );
    path.lineTo(size.width, size.height*0.50 );
    path.lineTo(size.width*0.90, 0 );
    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LocalisationClipper extends CustomClipper<Path> {
  LocalisationClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AutClipper extends CustomClipper<Path> {
  AutClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height*0.90);
    path.lineTo(size.width*0.50, size.height);
    path.lineTo(size.width, size.height * 0.90 );
    path.lineTo(size.width, 0 );

    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ComplementsClipper extends CustomClipper<Path> {
  ComplementsClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height*0.90);
    path.lineTo(size.width*0.50, size.height);
    path.lineTo(size.width, size.height*0.90 );
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
class GuideClipperC extends CustomClipper<Path> {
  GuideClipperC(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class GuideClipperR extends CustomClipper<Path> {
  GuideClipperR(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height*0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class GuideClipperL extends CustomClipper<Path> {
  GuideClipperL(this.radius);

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
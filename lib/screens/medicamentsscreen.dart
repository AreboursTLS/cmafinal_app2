import 'package:flutter/material.dart';
import 'package:cmafinal_app/services/medicamentslist.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cmafinal_app/assets/constants.dart';
import 'package:cmafinal_app/widgets/cmabottombar.dart';
import 'package:cmafinal_app/widgets/shapedwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cmafinal_app/widgets/clipshadow.dart';

class MedicamentsScreen extends StatefulWidget {
  @override
  _MedicamentsScreenState createState() => _MedicamentsScreenState();
}
class _MedicamentsScreenState extends State<MedicamentsScreen> {
  List<Medicament> _list = [];
  List<Medicament> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    _list.clear();
    loading=true;
    var response = await http.get('https://medicament.onad-monaco.mc/scripts/medicaments.json',);
    String source = Utf8Decoder().convert(response.bodyBytes);
    var data = json.decode(source);
    setState(() {
      for (Map i in data) {
        _list.add(Medicament.formJson(i));
        loading = false;
      }
    });

  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.name.toUpperCase().contains(text.toUpperCase()) ||
          f.substance.toUpperCase().contains(text.toUpperCase()) ||
          f.name.contains(text)  ||
          f.substance.contains(text)

      )
        _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CmaBottomBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                color: Color(0xFFbd0606),
                elevation: 5,
                child: Column(
                  children : [
                    TopBarWidget(onPress: () {
                      Navigator.pop(
                        context,
                      );
                    }, label1: 'Testez', label2: 'vos', label3: 'médicaments',),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      color: Color(0xFFbd0606),
                      child: Card(
                        elevation: 20,
                        child: ListTile(
                          leading: Icon(Icons.search),
                          title: TextField(
                            controller: controller,
                            onChanged: onSearch,
                            decoration: InputDecoration(
                                hintText: "Médicament ou substance...", border: InputBorder.none),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.clear();
                              onSearch('');
                            },
                            icon: Icon(Icons.cancel),
                          ),
                        ),
                      ),
                    ),],),
              ),
              loading
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Expanded(
                child: _search.length != 0 || controller.text.isNotEmpty
                    ? ListView.builder(
                  itemCount: _search.length,
                  itemBuilder: (context, i) {
                    final b = _search[i];
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RawMaterialButton(
                        onPressed: (){

                          Navigator.push(context, new MaterialPageRoute(builder: (context) =>MedicamentInfoPage(_search[i]) ));
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade600,
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(1,3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.arrow_forward,
                                  color: Color(0xFFbd0606),),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        b.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(b.substance),],),
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                )
                    : ListView(
                  children : [Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(1,3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.warning_amber_outlined,
                                    color: Color(0xFFbd0606),
                                    size: 50,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Avant la prise de votre médicament, vérifiez s’il ne contient pas de substances illicites ou s'il n'utilise une méthode d’administration interdite.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(1,3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.bullseye,
                                    color: Color(0xFFbd0606),
                                    size: 50,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Cette base de données cible uniquement les médicaments et substances autorisés à Monaco et en France. ",
                                      style: TextStyle(
                                          fontSize: 16.0),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(1,3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.user,
                                    color: Color(0xFFbd0606),
                                    size: 40,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "LE SPORTIF EST LE SEUL RESPONSABLE DE TOUT CE QU’IL INGÈRE.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(1,3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.capsules,
                                    color: Color(0xFFbd0606),
                                    size: 40,),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "les compléments alimentaires".toUpperCase(),
                                          style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "L’intérêt des compléments alimentaires pour améliorer la performance est (scientifiquement) rarement démontré. En revanche, leur usage peut être dangereux pour la santé. Les compléments alimentaires peuvent contenir des substances interdites qui n’apparaissent pas sur l’étiquetage. Leur consommation expose le sportif au risque d’un contrôle antidopage positif et à des sanctions pour VRAD. Il n’existe aucun label, norme ou certification qui puisse garantir à 100%qu’un produit ne contiendra pas de substances interdites.",
                                          style: TextStyle(
                                            fontSize: 16.0,),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Si vous pensez avoir besoin d’un complément alimentaire le CMA vous recommande :",
                                          style: TextStyle(
                                            fontSize: 16.0,),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "- de prendre conseil auprès d’un professionnel de santé expert en nutrition du sport,",
                                          style: TextStyle(
                                            fontSize: 16.0,),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "- en cas de prescription, de bien respecter doses et durée d’utilisation,",
                                          style: TextStyle(
                                            fontSize: 16.0,),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "- de vérifier que le compliment alimentaire est au minimum conforme à la norme NF 94V-001,",
                                          style: TextStyle(
                                            fontSize: 16.0,),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "- de toujours refuser les compléments alimentaires des « amis » ou d’origine incertaine ( salles desport , internet...).",
                                          style: TextStyle(
                                            fontSize: 16.0,),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicamentInfoPage extends StatelessWidget {
  final Medicament medicament;

  MedicamentInfoPage(this.medicament);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            medicament.name
        ),
        backgroundColor: kMasterRedColor,
      ),
      body:
      SizedBox(
        height: size.height*0.95,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left:8.0, right: 8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children : <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Text(medicament.name,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),),
                SizedBox(
                  height: 20.0,
                ),
                Container(child:
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              offset: Offset(1,3),
                            ),
                          ],
                        ),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Classe",
                              style: TextStyle(
                                color: kMasterRedColor,
                                fontWeight: FontWeight.bold,
                              ),),
                            Text(medicament.classe.isEmpty ? "Medicament ou Substance Non Classé" : medicament.classe,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),),
                          ],

                        ),

                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              offset: Offset(1,3),
                            ),
                          ],
                        ),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Principes Actifs",
                              style: TextStyle(
                                color: kMasterRedColor,
                                fontWeight: FontWeight.bold,
                              ),),
                            Text(medicament.substance,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),),
                          ],
                        ),

                      ),
                    ),
                  ],

                ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ClipShadow (
                        clipper: BackgroundClipper(),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 8),
                            blurRadius: 3.0,
                            spreadRadius: 5.0,
                            color: Colors.black54,
                          )
                        ],
                        child: Container(
                          //height: size.height * 0.20,
                          //width : size.width*0.25,
                          color : medicament.statut.contains("autorisé") || medicament.statut == ("Médicament contenant une substance interdite en compétition.")   ? Color(0xFF015713) : kMasterRedColor,
                          child: Padding(
                            padding: const EdgeInsets.only(top : 10.0, left : 10.0, right: 10.0, bottom: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Hors compétition".toUpperCase(),
                                  style: TextStyle(

                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Icon(medicament.statut.contains("autorisé") ||  medicament.statut == ("Médicament contenant une substance interdite en compétition.")  ?  FontAwesomeIcons.check : FontAwesomeIcons.times,
                                  color: Colors.white,
                                  size: 70,),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(medicament.statut.contains("autorisé") || medicament.statut == ("Médicament contenant une substance interdite en compétition.")  ? "autorisé".toUpperCase() : "Interdit".toUpperCase(),
                                  style: TextStyle(

                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),// drapeau gauche
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Container(
                        child :ClipShadow(
                          clipper: BackgroundClipper2(),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 8),
                              blurRadius: 3.0,
                              spreadRadius: 5.0,
                              color: Colors.black54,
                            )
                          ],
                          child: Container(
                            //height: size.height * 0.20,
                            //width : size.width*0.25,
                            color : medicament.statut == ("Médicament contenant une substance interdite en compétition.") || medicament.statut== "Médicament contenant une substance interdite en permanence (en et hors compétition)." ? kMasterRedColor : Color(0xFF015713),
                            child: Padding(
                              padding: const EdgeInsets.only(top : 10.0, left : 10.0, right: 10.0, bottom: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text("En".toUpperCase(),
                                        style: TextStyle(

                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontFamily: 'Cabin',
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text("compétition".toUpperCase(),
                                        style: TextStyle(

                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontFamily: 'Cabin',
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(medicament.statut== ("Médicament contenant une substance interdite en compétition.") || medicament.statut== "Médicament contenant une substance interdite en permanence (en et hors compétition)." ?  FontAwesomeIcons.times : FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 70,),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(medicament.statut== ("Médicament contenant une substance interdite en compétition.") || medicament.statut== "Médicament contenant une substance interdite en permanence (en et hors compétition)." ? "interdit".toUpperCase() : "autorisé".toUpperCase(),
                                    style: TextStyle(

                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),//drapeau droit
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView(
                    children : [Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : [
                          Text("Informations complémentaires",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kMasterRedColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child : Container(
                                  child: Column(
                                    crossAxisAlignment : CrossAxisAlignment.start,
                                    children : <Widget>[
                                      Text(medicament.procedure.isNotEmpty ?  "Procédure spécifique :".toUpperCase() : '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      Text(medicament.procedure.isNotEmpty ?  medicament.procedure : '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),),
                                    ], ), ), ), ], ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child : Container(
                                  child: Column(
                                    crossAxisAlignment : CrossAxisAlignment.start,
                                    children : <Widget>[
                                      Text(medicament.route.isNotEmpty ?  "Voie d'administration :".toUpperCase() : '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      Text(medicament.route.isNotEmpty ?  medicament.route.toUpperCase() :'',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),),
                                    ], ), ), ), ], ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child : Container(
                                  child: Text(medicament.infoComp.isNotEmpty ?  medicament.infoComp:''), ), ), ], ),
                          SizedBox(
                            height: 10,
                          ),
                        ],),],
                  ),
                ),
              ],),
          ),
        ),
      ),
    );
  }

}

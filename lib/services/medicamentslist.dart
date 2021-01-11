
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<void> getMedics() async {
  var response = await http.get('https://medicament.onad-monaco.mc/scripts/medicaments.json');
  var decodedData = jsonDecode(utf8.decode(response.bodyBytes));
  List<Medicament> medicaments = [];
  for(Map i in decodedData){
    medicaments.add(Medicament.formJson(i));
  }
  print(medicaments.length);
  return medicaments;
}

class Medicament {

  String route;
  //int productId;
  String name;
  String substance;
  String procedure;
  String specifications;
  String infoComp;
  String statut;
  String classe;
  //String alerte;

  Medicament({
    this.route,
    //this.productId,
    this.name,
    this.substance,
    this.procedure,
    this.specifications,
    this.infoComp,
    this.statut,
    this.classe,
    //this.alerte,
  });

  factory Medicament.formJson(Map <String, dynamic> json){
    return new Medicament(
      route: json['route'],
      //productId: json['product_Id'],
      name: json["name"],
      substance: json["substance"],
      procedure: json["Procédure"],
      specifications: json["Spécifications particulières"],
      infoComp: json["Information complémentaire"],
      statut: json["Statut"],
      classe: json["Classe"],
      //alerte: json["Alerte complémentaire"],
    );
  }
}

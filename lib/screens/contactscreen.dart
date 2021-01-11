import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cmafinal_app/assets/constants.dart';
import 'package:cmafinal_app/widgets/cmabottombar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:cmafinal_app/widgets/donwloadwidgets.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart';


class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  final _fieldcontroller1 = TextEditingController();
  final _fieldcontroller2 = TextEditingController();
  final _fieldcontroller3 = TextEditingController();

  String nom;
  String email;
  String textMessage;
  bool isSwitched = false;
  mailer() async {
    String username = 'onadmonacoapp@gmail.com';
    String password = 'Aa@30051512';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, '$nom')
      ..recipients.add('thomas@lapras.fr')
      ..subject = 'Nouveau message via l\'application ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Message $nom $email : </h1>\n<p>$textMessage</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center =
      const LatLng(43.72770531521677, 7.415730255462962);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: kMasterRedColor,
      child: Icon(icon, size: 36.0),
    );
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_center.toString()),
        position: _center,
        infoWindow:
            InfoWindow(title: 'This is a Title', snippet: 'This is a snippet'),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CmaBottomBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 16.0,
                          ),
                          mapType: _currentMapType,
                          markers: _markers,
                          onCameraMove: _onCameraMove,
                          myLocationButtonEnabled: false,
                          myLocationEnabled: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            children: [
                              //button(_onMapTypeButtonPressed, Icons.map),
                              SizedBox(
                                height: 16.0,
                              ),
                              button(_onAddMarkerButtonPressed,
                                  Icons.add_location),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ), //gmap
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30.0, bottom: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.locationArrow,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Adresse'.toUpperCase(),
                                  style: TextStyle(
                                    color: kMasterRedColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato',
                                    letterSpacing: 3,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '13 avenue des Castelans,'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato',
                                    letterSpacing: 3,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Entrée E - 98 000 Monaco'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Cabin',
                                    letterSpacing: 3,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.envelope,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email'.toUpperCase(),
                                  style: TextStyle(
                                    color: kMasterRedColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato',
                                    letterSpacing: 3,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'CONTACT@ONAD-MONACO.MC'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato',
                                    letterSpacing: 3,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.phone,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                makePhoneCall('tel:+377 97 77 56 49');
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'téléphone'.toUpperCase(),
                                    style: TextStyle(
                                      color: kMasterRedColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      letterSpacing: 3,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '+377 97 77 56 49'.toUpperCase(),
                                      style: TextStyle(
                                        color: kMasterRedColor,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',
                                        letterSpacing: 3,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.fax,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fax'.toUpperCase(),
                                  style: TextStyle(
                                    color: kMasterRedColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato',
                                    letterSpacing: 3,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '+377 97 77 56 28'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato',
                                    letterSpacing: 3,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //coordonnées
                Card(
                  child: Container(
                    color: kMasterRedColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'NOUS LAISSER UN MESSAGE',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cabin',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                'ANONYME',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Cabin',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Transform.scale(
                                scale: 1.3,
                                child: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                  activeTrackColor: Colors.white,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: isSwitched ? false : true,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30),
                            child: TextField(
                              controller: _fieldcontroller1,
                              obscureText: false,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () => _fieldcontroller1.clear(),
                                  icon: Icon(FontAwesomeIcons.timesCircle),
                                ),
                                filled: true,
                                labelText: 'NOM',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cabin',
                                  color: kMasterRedColor,
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: isSwitched ? false : true,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30),
                            child: TextField(
                              controller: _fieldcontroller2,
                              obscureText: false,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () => _fieldcontroller2.clear(),
                                  icon: Icon(FontAwesomeIcons.timesCircle),
                                ),
                                filled: true,
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cabin',
                                  color: kMasterRedColor,
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              reverse: true,
                              child: TextField(
                                controller: _fieldcontroller3,
                                maxLines: 2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () => _fieldcontroller3.clear(),
                                    icon: Icon(FontAwesomeIcons.timesCircle),
                                  ),
                                  filled: true,
                                  labelText: 'Message',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cabin',
                                    color: kMasterRedColor,
                                  ),
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            elevation: 10,
                            color: Colors.white,
                            onPressed: () {
                              if (isSwitched == true) {
                                  setState(() {
                                    nom = 'Anonyme';
                                    email ='Email anonyme';
                                    textMessage =_fieldcontroller3.text;
                                  });
                                } else {
                                setState(() {
                                  nom = 'de ${_fieldcontroller1.text}';
                                  email = 'email de contact : ${_fieldcontroller2.text}';
                                  textMessage = _fieldcontroller3.text;
                                });}
                              mailer();
                              print('$nom $email $textMessage');
                              print('pressed');
                            },
                            child: Text(
                              'Envoyer'.toUpperCase(),
                              style: TextStyle(
                                color: kMasterRedColor,
                                fontSize: 20,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    color: kMasterWhiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children : [
                          Text(
                            'Visioconférence'.toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Vous pouvez vous connecter à notre salon privé Whereby de visioconférence afin d'échanger avec le CMA. Veuillez nous contacter pour obtenir votre mot de passe de connexion.",
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontSize: 14,
                            ),
                          textAlign: TextAlign.justify,),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              elevation: 10,
                              color: kMasterRedColor,
                              onPressed: () {
                                launchInApp('https://whereby.com/onadmc-publique1');
                              },
                              child: Text(
                                'Se connecter'.toUpperCase(),
                                style: TextStyle(
                                  color: kMasterWhiteColor,
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                          ),
                        ],),
                    ),
                  ),
                ),],
            ),
          ],
        ),
      ),
    );
  }
}

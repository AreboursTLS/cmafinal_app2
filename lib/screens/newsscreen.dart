import 'package:flutter/material.dart';
import 'package:cmafinal_app/services/medicamentslist.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cmafinal_app/assets/constants.dart';
import 'package:cmafinal_app/widgets/cmabottombar.dart';
import 'package:cmafinal_app/widgets/shapedwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cmafinal_app/widgets/clipshadow.dart';
import 'package:cmafinal_app/services/postslists.dart';
import 'package:intl/intl.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMasterRedColor,
      bottomNavigationBar: CmaBottomBar(),
      body: Column(
        children: [
          TopBarWidget(onPress: (){Navigator.pop(context);}, label1: 'Les', label2: 'actualités', label3: 'du CMA'),
          SizedBox(
            height: 5,
          ),
          Container(
                    child: Expanded(
                      child: FutureBuilder(
                        future: fetchPosts(),
                        builder: (context, snapshot){
                          if(snapshot.hasData) {
                            return  ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index){
                                  Map posts = snapshot.data[index];
                                  var imageurl = posts['attachments'][0]['images']['thumbnail']['url'];
                                  print(imageurl);
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Card(
                                            child: SizedBox(
                                                width: 100,
                                                child: Image.network(imageurl)),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(posts['title'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cabin',
                                                  fontSize: 16,
                                                ),),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(posts['date']),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );


                                }

                            );

                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
        ],
      ),
      );
  }
}



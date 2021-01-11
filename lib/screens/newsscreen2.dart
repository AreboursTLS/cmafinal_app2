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
import 'package:html/parser.dart';

class NewsScreen2 extends StatefulWidget {
  @override
  _NewsScreen2State createState() => _NewsScreen2State();
}

class _NewsScreen2State extends State<NewsScreen2> {
  List<Post> _listposts = [];
  List<Medicament> _search = [];
  var loading = false;

  Future<Null> fetchData() async {
    _listposts.clear();
    loading = true;
    var response = await http.get(
      'https://onad-monaco.mc/api/get_posts/',
    );
    String source = Utf8Decoder().convert(response.bodyBytes);
    var data = json.decode(source)['posts'];
    setState(() {
      for (Map i in data) {
        _listposts.add(Post.formJson(i));
        loading = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMasterRedColor,
      bottomNavigationBar: CmaBottomBar(),
      body: Column(
        children: [
          TopBarWidget(
              onPress: () {
                Navigator.pop(context);
              },
              label1: 'Les',
              label2: 'actualités',
              label3: 'du CMA'),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                  itemCount: _listposts.length,
                  itemBuilder: (context, i) {
                    final b = _listposts[i];
                    var imageurl = b.thumbnail;
                    print(imageurl);
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPosts(_listposts[i])));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Card(
                                child: SizedBox(
                                    width: 100, child: Image.network(imageurl)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      b.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cabin',
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(b.date),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsPosts extends StatelessWidget {
  final Post post;

  DetailsPosts(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        backgroundColor: kMasterRedColor,
      ),
      body: Column(
        children: [
          Card(
            child: Image.network(post.image),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(parse(post.content.toString()).documentElement.text,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

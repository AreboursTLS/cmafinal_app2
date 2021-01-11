import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List> fetchPostsJsonData() async {
  final response = await http.get('https://onad-monaco.mc/api/get_posts/');
  String data = response.body;
  String source = Utf8Decoder().convert(response.bodyBytes);
  var decodedJsonData = jsonDecode(source)['posts'];
  return decodedJsonData;
}

Future<List> fetchPosts() async {
  final response = await http.get('https://onad-monaco.mc/api/get_recent_posts/');
  String data = response.body;
  String source = Utf8Decoder().convert(response.bodyBytes);
  var decodedJsonData = jsonDecode(source)['posts'];
  List<Post> posts = [];
  for(Map i in decodedJsonData){
    posts.add(Post.formJson(i));
  }
  return posts;
}

class Post {

  String title;
  String thumbnail;
  //int productId;
  String image;
  String date;
  String content;
  //String alerte;

  Post({
    this.title,
    this.thumbnail,
    this.image,
    this.date,
    this.content,
  });

  factory Post.formJson(Map <String, dynamic> json){
    return new Post(
      title: json['title'],
      thumbnail: json['attachments'][0]['images']['thumbnail']['url'],
      image: json['attachments'][0]['images']['medium']['url'],
      date: json["date"],
      content: json['content'],
    );
  }
}
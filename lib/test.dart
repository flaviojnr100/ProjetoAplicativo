import 'dart:convert';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

Future<Post> find() async {
  var response = await http.get("http://localhost:3000/auth/user");
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falha ao carregar um post');
  }
}

class Teste extends StatelessWidget {
  final Future<Post> post;
  const Teste({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<Post>(
              future: post,
              builder: (context, snapshot) {
                print(snapshot.data.body);
              })),
    );
  }
}

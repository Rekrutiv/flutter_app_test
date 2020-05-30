import 'package:flutter_app_test/models/Users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_app_test/models/Comments.dart';

class UsersService{

  Future<List<Users>> fetchusers() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    var jsonResponse = convert.jsonDecode(response.body) as List;
    return jsonResponse.map((users) => Users.fromJson(users)).toList();
  }

  Future<Comments> fetchcomments(int id) async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts/$id/comments");
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse.map((comments) => Comments.fromJson(comments)).toList();
  }

}
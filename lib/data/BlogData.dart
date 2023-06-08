import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/PostModel.dart';

class BlogData{
  static Future<List<PostModel>> getPosts() async{
    List<PostModel> list = [];
    String url = "https://jsonplaceholder.typicode.com/posts";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    final body =  response.body ;
    var jsonList = jsonDecode(body) as List;
    list = jsonList.map((e) => PostModel.fromJson(e)).toList();
    return list;
  }

  static Future<PostModel?> getPost(String id) async{
    PostModel? post;
    final url = "https://jsonplaceholder.typicode.com/posts/$id";
    final uri = Uri.parse(url);
    final result = await http.get(uri);
    final json = jsonDecode(result.body);
    post = PostModel.fromJson(json);
    return post;
  }
}
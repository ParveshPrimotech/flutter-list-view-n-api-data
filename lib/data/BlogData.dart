import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/CommentModel.dart';
import '../models/PostModel.dart';

class BlogData{

  static const baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<PostModel>> getPosts() async{
    List<PostModel> list = [];
    String url = "$baseUrl/posts";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    final body =  response.body ;
    var jsonList = jsonDecode(body) as List;
    list = jsonList.map((e) => PostModel.fromJson(e)).toList();
    return list;
  }

  static Future<PostModel?> getPost(String id) async{
    PostModel? post;
    final url = "$baseUrl/posts/$id";
    final uri = Uri.parse(url);
    final result = await http.get(uri);
    final json = jsonDecode(result.body);
    post = PostModel.fromJson(json);
    return post;
  }


  static Future<List<CommentModel>> getComments(String postId) async{
    List<CommentModel> list= [];
    final url = "$baseUrl/posts/$postId/comments";
    final uri = Uri.parse(url);
    final result = await http.get(uri);
    final json = jsonDecode(result.body) as List;
    list = json.map((e) => CommentModel.fromJson(e)).toList();
    return list;
  }
}
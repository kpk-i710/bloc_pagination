import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:package_infinite/post/model/post.dart';

class PostApi {
  static String _domain = "jsonplaceholder.typicode.com";
  static String _path = "/posts";

  static Future<List<Post>> fetchPost(int start, int limit) async {
    final response = await http.get(
      Uri.https(
        _domain,
        _path,
        {"_start": "$start", "_limit": "$limit"},
      ),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch post");
    }

    final json = jsonDecode(response.body) as List;
    return json.map<Post>((post) => Post.fromJson(post)).toList();
  }
}

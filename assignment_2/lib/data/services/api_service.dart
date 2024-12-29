import 'package:http/http.dart';
import 'dart:convert';
import '../models/post_model.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  /// Fetches posts from the API
  static Future<List<Post>> fetchPosts() async {
    try {
      final Uri url = Uri.parse(_baseUrl);
      final Response response = await get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching posts: $e');
    }
  }
}

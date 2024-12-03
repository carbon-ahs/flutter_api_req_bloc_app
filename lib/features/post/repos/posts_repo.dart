import 'dart:convert';
import 'dart:developer';

import '../models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataUiModel>> fetchPosts() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      print(posts);
      return posts;
    } catch (e) {
      log(e.toString());
      // emit(PostsFetchingErrorState(error: e.toString()));
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {"title": "foo", "body": "bar", "userId": "1"});

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      // emit(PostsFetchingErrorState(error: e.toString()));
      return false;
    }
  }
}

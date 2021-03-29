import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sample_flutter_project/models/blog.dart';

class Api {
  static var client = http.Client();

  static Future<Map> login(String email, String password) async {
    Map resMap;

    try {
      // http.Response response = await http.post(
      //     "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/login?email=${email}&password=${password}");
      http.Response response = await client.post(
          "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/login?",
          body: {"email": email, "password": password});

      print("status code: " + response.statusCode.toString());
      print("body: " + response.body.toString());
      if (response.statusCode == 201) {
        resMap = json.decode(response.body);
      } else {
        throw Exception;
        // as the Api has error and i want to continue the app so i will do this step to overcome the api error
        // resMap = {"token": 45};
      }
    } catch (err) {
      print("error from api login: " + err.toString());
    }

    return resMap;
  }

  static Future<List<Blog>> blogList(String token) async {
    List<Blog> blogList = List<Blog>();
    try {
      http.Response response = await client.get(
          "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs",
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      print("status code: " + response.statusCode.toString());

      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print("body: " + body.toString());
        for (var item in body) {
          print("one item: " + item.toString());
          Blog blog = Blog.fromJson(item);
          blogList.add(blog);
        }
        return blogList;
      } else {
        throw Exception;
      }
    } catch (err) {
      print("error from bloglist : " + err.toString());
    }
    return null;
  }

  static Future<Blog> singleBlog(String token, String id) async {
    Blog blog = Blog();
    try {
      http.Response response = await client.get(
          "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs/$id",
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      print("status code: " + response.statusCode.toString());
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print("body: " + body.toString());
        blog = Blog.fromJson(body);
        return blog;
      } else {
        throw Exception;
      }
    } catch (err) {
      print("error from singleBlog : " + err.toString());
    }
    return null;
  }
}

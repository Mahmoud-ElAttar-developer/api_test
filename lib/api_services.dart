import 'dart:convert';

import 'package:api_test/constant.dart';
import 'package:api_test/post_model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // convert url from string to url
  // requst api using http
  // check if statuscode == 200 (success)
  // convert response body from string to json (JsonDecoder.decode(response.body))

  static Future<List<PostModel>?> getPosts() async {
    try {
      // 1- here we call the api
      var url = Uri.parse(AppConstants.baseUrl + AppConstants.postsEndpoint);

      // 2- here we get the response
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // السيرفر الجديد يضع القائمة داخل ماب اسمه posts
        Map<String, dynamic> responseData = jsonDecode(response.body);
        List data = responseData['posts'];

        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // static Future<List<PostModel>?> getPosts() async {
  //   try {
  //     // 1- here we call the api
  //     var url = Uri.parse(AppConstants.baseUrl + AppConstants.postsEndpoint);

  //     // 2- here we get the response
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List data = jsonDecode(response.body);

  //       List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
  //       return posts;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     rethrow;
  //   }
  //   return null;
  // }
}

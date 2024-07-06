import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/article.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = '94fcf1c4d150437a972ff72444695828';
  static const String _category = 'technology';
  static const String _country = 'us';

  Future<ArticlesResult> getArticles() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load articles');
    }
  }
}

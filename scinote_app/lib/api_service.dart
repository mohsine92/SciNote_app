import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';

const String apiBaseUrl = 'http://192.168.1.20:8888/scinote/api';

class ApiService {
  // Récupérer tous les articles
  static Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('$apiBaseUrl/ArticleApi.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Erreur réseau : ${response.statusCode}');
    }
  }
}
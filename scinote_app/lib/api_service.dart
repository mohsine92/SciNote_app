import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.1.20:8888/scinote/api"; 

  /// Récupère les articles avec pagination
  Future<List> getArticles({int page = 1, int limit = 10}) async {
    try {
      final uri = Uri.parse('$baseUrl/ArticleApi.php?page=$page&limit=$limit');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is List) {
          return data;
        } else if (data['articles'] != null && data['articles'] is List) {
          return List.from(data['articles']);
        }
        return [];
      } else {
        throw Exception('Erreur API : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau : $e');
    }
  }
}
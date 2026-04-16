import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class ApiService {
  Future<List<Article>> fetchArticles() async {
    final res = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (res.statusCode == 200) {
      List data = json.decode(res.body);
      return data.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception("Lỗi API");
    }
  }
}
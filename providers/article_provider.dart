import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/api_service.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> articles = [];
  List<Article> favorites = [];
  bool isLoading = false;

  Future<void> fetchArticles() async {
    try {
      isLoading = true;
      notifyListeners();

      final ApiService _api = ApiService();

      articles = await _api.fetchArticles();
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(Article article) {
    if (favorites.contains(article)) {
      favorites.remove(article);
    } else {
      favorites.add(article);
    }
    notifyListeners();
  }

  bool isFavorite(Article article) {
    return favorites.contains(article);
  }
}
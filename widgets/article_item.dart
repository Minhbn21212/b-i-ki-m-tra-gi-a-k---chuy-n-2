import 'package:flutter/material.dart';
import '../../models/article.dart';
import '../views/screens/detail_screen.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(article.image, width: 60),
        title: Text(article.title),
        subtitle: Text(article.body, maxLines: 2),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailScreen(article: article),
            ),
          );
        },
      ),
    );
  }
}
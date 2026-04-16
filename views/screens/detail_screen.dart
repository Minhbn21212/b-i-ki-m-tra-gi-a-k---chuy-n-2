import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/article.dart';
import '../../../viewmodels/article_viewmodel.dart';

class DetailScreen extends StatelessWidget {
  final Article article;

  const DetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ArticleViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Chi tiết")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.image),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(article.title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(article.body),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () =>
                        vm.toggleFavorite(article),
                    child: Text(vm.isFavorite(article)
                        ? "Bỏ yêu thích"
                        : "Yêu thích"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
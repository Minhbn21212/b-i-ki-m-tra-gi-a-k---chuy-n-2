import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/article_viewmodel.dart';
import '../../widgets/article_item.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ArticleViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Yêu thích")),
      body: vm.favorites.isEmpty
          ? Center(child: Text("Chưa có bài yêu thích"))
          : ListView.builder(
        itemCount: vm.favorites.length,
        itemBuilder: (ctx, i) =>
            ArticleItem(article: vm.favorites[i]),
      ),
    );
  }
}
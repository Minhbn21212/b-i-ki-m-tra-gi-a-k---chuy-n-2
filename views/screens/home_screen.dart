import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/article_viewmodel.dart';
import '../../widgets/article_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "";

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ArticleViewModel>(context, listen: false)
            .loadArticles());
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ArticleViewModel>(context);

    var filtered = vm.articles
        .where((e) =>
        e.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () =>
                Navigator.pushNamed(context, '/favorite'),
          )
        ],
      ),
      body: vm.isLoading
          ? Center(child: CircularProgressIndicator())
          : vm.error.isNotEmpty
          ? Center(child: Text(vm.error))
          : RefreshIndicator(
        onRefresh: vm.loadArticles,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Tìm kiếm...",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) =>
                  setState(() => query = value),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (ctx, i) =>
                    ArticleItem(article: filtered[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/provider/base_view.dart';
import 'package:flutter_scaffold/core/scoped_models/article_model.dart';

class ArticleListPage extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文章列表"),
      ),
      body: BaseView<ArticleModel>(
        onModelReady: (model) => _refreshKey.currentState?.show(),
        builder: (context, article, child) => Stack(
          children: <Widget>[
            Offstage(
              offstage: article.data.isNotEmpty,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.inbox, color: Colors.black26, size: 50),
                    Text("暂无文章", style: TextStyle(color: Colors.black26, fontSize: 18))
                  ],
                ),
              ),
            ),
            RefreshIndicator(
              key: _refreshKey,
              onRefresh: () => article.getData(),
              child: ListView.separated(
                itemCount: article.data.length,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemBuilder: (BuildContext context, int index) => _buildArticleItem(context, index, article),
                separatorBuilder: (BuildContext context, int index) => _buildSeparator(context, index, article),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, int index, ArticleModel article) {
    var _article = article.data[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(_article.subject, style: TextStyle(fontSize: 18)),
        Text(_article.content, style: TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget _buildSeparator(BuildContext context, int index, ArticleModel model) {
    return Container(height: 10);
  }
}


import 'package:daily_news/viewmodels/news_article_list_view_model.dart';
import 'package:daily_news/widgets/news_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(Icons.more_vert)
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text('News',style: TextStyle(
                fontSize: 50
              ),),
            ),
            Divider(
              color: Colors.black,
              height: 40,
              thickness: 8,
              indent: 30,
              endIndent: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 15,bottom: 15),
              child: Text('Headline',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
            Expanded(child: NewsGrid(articles: listViewModel.articles,),)

          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/viewmodels/news_article_view_model.dart';
import 'package:daily_news/widgets/circle_image.dart';
import 'package:flutter/material.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsGrid({ this.articles});


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        print('+++++++ '+this.articles[index].urlToImage);
        var article=articles[index];
        return GridTile(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20) ,
             // child: Image.network(this.articles[index].urlToImage),
            child: CircleImage(
                urlToImage:  article.urlToImage
            ),
          ),
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15 ),
            child: Text(article.title,style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
      itemCount: this.articles.length-1,
    );
  }
}

import 'package:daily_news/models/news_article.dart';
import 'package:daily_news/services/web_service.dart';
import 'package:flutter/material.dart';

import 'news_article_view_model.dart';

enum LoadingStatus{
  completed,
  searching,
  empty
}


class NewsArticleListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus=LoadingStatus.empty;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();


  void topHeadLines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();
    loadingStatus= LoadingStatus.searching;
    notifyListeners();

    this.articles= newsArticles.map((article)=>NewsArticleViewModel(article:article)).toList();

    if(this.articles.isEmpty){
    this.loadingStatus=LoadingStatus.empty;

    }else{
      this.loadingStatus=LoadingStatus.completed;
    }
    notifyListeners();
  }
}
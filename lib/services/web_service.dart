import 'package:daily_news/models/news_article.dart';
import 'package:dio/dio.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadLines() async{

    String url= "https://newsapi.org/v2/top-headlines?country=us&apiKey=1a028da006744eb2b662288307461160";

    final response= await dio.get(url);

    if(response.statusCode==200){
      final result = response.data;
      Iterable list= result['articles'];
      return list.map((article)=>NewsArticle.fromJson(article)).toList();

    } else{
      throw Exception("failed to get top news");

    }

  }
}
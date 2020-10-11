import 'package:http/http.dart' as http;
import 'package:smart_news_api/article.dart';
import 'dart:convert';

import 'package:smart_news_api/constants/strings.dart';
class News{
  List<Article> news = [];
String api_key = "d0f9fc6824f44f6c9a6ba9bed10ca9a3";

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=${api_key}";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        //check for articles with images
        if(element['urlToImage'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
          );
          news.add(article);
        }
      });
    }
  }
}
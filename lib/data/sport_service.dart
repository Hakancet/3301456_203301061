import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/SporArticles.dart';



class NewsService {
  static NewsService _singleton = NewsService._iternal();
  NewsService._iternal();


  factory NewsService(){
    return _singleton;
  }

  static Future<List<Articles>?> getNews() async{
    final url = Uri.parse('https://newsapi.org/v2/top-headlines?country=tr&category=sports&apiKey=8d2843a042b24772a023bc93ef30aef4') ;
    final response = await http.get(url);


    if (response.body.isNotEmpty){
      final responseJson = json.decode(response.body);
      SporHaber news = SporHaber.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
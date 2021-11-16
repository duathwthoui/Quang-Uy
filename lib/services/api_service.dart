import 'dart:convert';

import 'package:newsapp/model/article_model.dart';
import 'package:http/http.dart';



class ApiService {


  String Url =
      "https://newsapi.org/v2/everything?q=tesla&from=2021-10-16&sortBy=publishedAt&apiKey=9829c61866684ec3bd277c72853f2254";




  Future<List<Article>> getArticle() async {

    Response res = await get(Uri.parse(Url));


    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];


      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
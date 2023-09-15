import 'dart:convert';

import 'package:http/http.dart';
import 'model.dart';

class Api {
  final endPoint =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=f0d39cdc9a444bf6936ebcd11ef84d3d';

  Future<List<Articles>> fetchData() async {
    Response response = await get(Uri.parse(endPoint));
    print(response.body);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Articles> articles = body.map((e) => Articles.fromJson(e)).toList();
    return articles;
  }

  Future<List<Articles>> filteredData(String data) async {
    Response response = await get(Uri.parse(endPoint));
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Articles> articles = body.map((e) => Articles.fromJson(e)).toList();
    List<Articles> filteredList =
        articles.where((element) => element.source!.name == data).toList();
    return filteredList;
  }
}

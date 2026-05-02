import 'dart:convert';

import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/models/news_model.dart';
import 'package:news_app/feature/home/data/repo/data_source/home_data_source.dart';
import 'package:http/http.dart' as http;

class HomeRemoteDartaSourceImp implements HomeDataSource {
  @override
  Future<ResuletApi<NewsModel>> getNews() async {
    try {
      Uri url = Uri.https("newsapi.org", "/v2/everything", {
        'q': "bitcoin",
        'apiKey': "4cd4fbcaab504103a0a227a9542bcd0c",
      });
      var respons = await http.get(url);
      if (respons.statusCode == 200 && respons.statusCode < 300) {
        String responsBody = respons.body;
        Map<String, dynamic> json = jsonDecode(responsBody);
        return Success<NewsModel>(NewsModel.fromJson(json));
      } else {
        return Error("Error on requst of Api");
      }
    } on Exception catch (e) {
      return Error<NewsModel>(e.toString());
    }
  }
}

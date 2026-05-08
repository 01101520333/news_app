import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/handler/api_handler_http_e.dart';
import 'package:news_app/feature/home/data/models/news_dto.dart';
import 'package:news_app/core/network/resulet_api.dart';

class HomeApi {
  Future<ResultApi<NewsDto>> getNews() async {
    return ApiHandlerHttpE.execute<NewsDto>(
      () async {
        Uri url = Uri.https("newsapi.org", "/v2/everything", {
          'q': "bitcoin",
          'apiKey': "4cd4fbcaab504103a0a227a9542bcd0c",
        });
        var respons = await http.get(url);
        return respons;
      },
      (body) {
        final Map<String, dynamic> json = jsonDecode(body);
        return NewsDto.fromJson(json);
      },
    );
  }
}

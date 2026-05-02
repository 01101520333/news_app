import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/models/news_model.dart';

abstract interface class HomeDataSource {
  Future<ResuletApi<NewsModel>> getNews();
}

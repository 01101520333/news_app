import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/domain/entities/news_entity.dart';

abstract interface class HomeRepository {
  Future<ResuletApi<NewsEntity>> getNews();
}

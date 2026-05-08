import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/api/home_api.dart';
import 'package:news_app/feature/home/data/models/news_dto.dart';
// import 'package:http/http.dart' as http;
import 'package:news_app/feature/home/domain/entities/news_entity.dart';
import 'package:news_app/feature/home/domain/repo/data_source/home_data_source.dart';

class HomeRemoteDartaSourceImp implements HomeDataSource {
  HomeRemoteDartaSourceImp(this._api);
  final HomeApi _api;

  @override
  Future<ResultApi<NewsEntity>> getNwes() async {
    final resulte = await _api.getNews();
    switch (resulte) {
      case SuccessApi<NewsDto>():
        final newsDto = resulte.data;
        return SuccessApi<NewsEntity>(newsDto.toEntity());
      case ErrorApi<NewsDto>():
        return ErrorApi<NewsEntity>(resulte.error);
    }
  }
}

HomeDataSource homeDataSourceInjectable() =>
    HomeRemoteDartaSourceImp(HomeApi());

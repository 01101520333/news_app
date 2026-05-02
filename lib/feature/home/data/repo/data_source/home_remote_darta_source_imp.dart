import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/api/home_api.dart';
import 'package:news_app/feature/home/data/models/news_model.dart';
// import 'package:http/http.dart' as http;
import 'package:news_app/feature/home/domain/entities/news_entity.dart';
import 'package:news_app/feature/home/domain/repo/data_source/home_data_source.dart';

class HomeRemoteDartaSourceImp implements HomeDataSource {
  HomeRemoteDartaSourceImp(this._api);
  final HomeApi _api;

  @override
  Future<ResuletApi<NewsEntity>> getNwes() async {
    final resulte = await _api.getNews();
    switch (resulte) {
      case Success<NewsDto>():
        final newsDto = resulte.data;
        return Success<NewsEntity>(newsDto.toEntity());
      case Error<NewsDto>():
        return Error<NewsEntity>(resulte.error);
    }
  }
}

HomeDataSource homeDataSourceInjectable() =>
    HomeRemoteDartaSourceImp(HomeApi());

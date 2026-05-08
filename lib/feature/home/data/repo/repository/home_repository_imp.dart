import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/repo/data_source/home_remote_darta_source_imp.dart';
import 'package:news_app/feature/home/domain/entities/news_entity.dart';
import 'package:news_app/feature/home/domain/repo/data_source/home_data_source.dart';
import 'package:news_app/feature/home/domain/repo/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp(this.dataSource);
  HomeDataSource dataSource;

  @override
  Future<ResultApi<NewsEntity>> getNews() async {
    final resulte = await dataSource.getNwes();
    switch (resulte) {
      case SuccessApi<NewsEntity>():
        final newsEntity = resulte.data;
        return SuccessApi(newsEntity);
      case ErrorApi<NewsEntity>():
        return ErrorApi(resulte.error);
    }
  }
}

HomeRepository homeRepositoryinjectable() =>
    HomeRepositoryImp(homeDataSourceInjectable());

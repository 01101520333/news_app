import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/models/news_model.dart';
import 'package:news_app/feature/home/data/repo/data_source/home_data_source.dart';
import 'package:news_app/feature/home/data/repo/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp(this.dataSource);
  HomeDataSource dataSource;
  @override
  Future<ResuletApi<NewsModel>> getNews() => dataSource.getNews();
}

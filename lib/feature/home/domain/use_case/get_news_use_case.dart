import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/repo/repository/home_repository_imp.dart';
import 'package:news_app/feature/home/domain/entities/news_entity.dart';
import 'package:news_app/feature/home/domain/repo/repository/home_repository.dart';

class GetNewsUseCase {
  GetNewsUseCase(this._repo);

  final HomeRepository _repo;

  Future<ResuletApi<NewsEntity>> invoke() => _repo.getNews();
}

GetNewsUseCase getNewsUseCaseInject() =>
    GetNewsUseCase(homeRepositoryinjectable());

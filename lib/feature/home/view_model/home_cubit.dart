import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/models/news_model.dart';
import 'package:news_app/feature/home/data/repo/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  HomeRepository repo;
  List<Articles> articles = [];
  String errorMasseg = "";

  Future<void> getNews() async {
    emit(Homeloading());
    final resulet = await repo.getNews();
    switch (resulet) {
      case Success<NewsModel>():
        articles = resulet.data.articles ?? [];
        emit(HomeSuccess());
      case Error<NewsModel>():
        errorMasseg = resulet.error;
        emit(HomeError(errorMasseg));
    }
  }
}

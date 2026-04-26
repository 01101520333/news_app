import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/data/api/news_api.dart';
import 'package:news_app/feature/home/data/models/news_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Articles> articles = [];
  String errorMasseg = "";

  Future<void> getNews() async {
    emit(Homeloading());
    final resulet = await NewsApi.getNews();
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

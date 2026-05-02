import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/network/resulet_api.dart';
import 'package:news_app/feature/home/domain/entities/news_entity.dart';
import 'package:news_app/feature/home/domain/use_case/get_news_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit([this.getNewsUseCase]) : super(HomeInitial());
  // HomeRepository repo;
  final GetNewsUseCase? getNewsUseCase;
  List<ArticleEntity> articles = [];
  String errorMasseg = "";

  Future<void> getNews() async {
    emit(Homeloading());
    final resulet = await getNewsUseCase!.invoke();
    switch (resulet) {
      case Success<NewsEntity>():
        articles = resulet.data.articles;
        emit(HomeSuccess());
      case Error<NewsEntity>():
        errorMasseg = resulet.error;
        emit(HomeError(errorMasseg));
    }
  }
}

part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class Homeloading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}

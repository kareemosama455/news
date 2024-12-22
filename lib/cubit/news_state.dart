part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsBottomNavState extends NewsState {}


//Business
final class NewsGetBusinessLoading extends NewsState {}

final class NewsGetBusinessSuccess extends NewsState {}

final class NewsGetBusinessFailure extends NewsState {
  final String message;
   NewsGetBusinessFailure({required this.message});
}


//Science
final class NewsGetScienceLoading extends NewsState {}

final class NewsGetScienceSuccess extends NewsState {}

final class NewsGetScienceFailure extends NewsState {
  final String message;
   NewsGetScienceFailure({required this.message});
}
//Sports

final class NewsGetSportsLoading extends NewsState {}

final class NewsGetSportsSuccess extends NewsState {}

final class NewsGetSportsFailure extends NewsState {
  final String message;
   NewsGetSportsFailure({required this.message});
}

final class ChangeNewsAppTheme extends NewsState{}

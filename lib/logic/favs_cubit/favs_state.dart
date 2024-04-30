part of 'favs_cubit.dart';

sealed class FavsState {}

final class FavsInitial extends FavsState {}

final class FavsLoading extends FavsState {}

final class FavsFetchSuccess extends FavsState {
  final List<Article> articles;

  FavsFetchSuccess({required this.articles});
}

final class FavsFetchFailed extends FavsState {
  final String msg;

  FavsFetchFailed({required this.msg});
}

final class FavsSaveSuccess extends FavsState {}

final class FavsSaveFailed extends FavsState {
  final String msg;

  FavsSaveFailed({required this.msg});
}

part of 'news_cubit.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsFetchSuccess extends NewsState {
  final List<Article> articles;

  NewsFetchSuccess({required this.articles});
}

final class NewsFetchFailed extends NewsState {
  final String msg;

  NewsFetchFailed({required this.msg});
}

import 'package:bloc/bloc.dart';
import 'package:kalpas_task/models/article_model.dart';
import 'package:kalpas_task/services/news_api_service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsApiService _newsApiService;

  NewsCubit(this._newsApiService) : super(NewsInitial());

  void fetchNews() async {
    emit(NewsLoading());
    try {
      List<Article> articles = await _newsApiService.fetchEverythingNews();
      emit(NewsFetchSuccess(articles: articles));
    } catch (e) {
      emit(NewsFetchFailed(msg: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:kalpas_task/models/article_model.dart';
import 'package:kalpas_task/services/local_db_service.dart';

part 'favs_state.dart';

class FavsCubit extends Cubit<FavsState> {
  final LocalDbService _localDbService;
  FavsCubit(this._localDbService) : super(FavsInitial());

  void fetchFavs() async {
    emit(FavsLoading());
    try {
      List<Article> articles = await _localDbService.getFavorites();
      emit(FavsFetchSuccess(articles: articles));
    } catch (e) {
      emit(FavsFetchFailed(msg: e.toString()));
    }
  }

  void saveToFavs(Article article) async {
    emit(FavsLoading());
    try {
      await _localDbService.addToFavorite(article);
      emit(FavsSaveSuccess());
    } catch (e) {
      emit(FavsSaveFailed(msg: e.toString()));
    }
  }
}

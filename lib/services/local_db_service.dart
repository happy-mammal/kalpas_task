import 'package:kalpas_task/models/article_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDbService {
  Future<void> _createTables(Database database) async {
    await database.execute("""CREATE TABLE articles(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        urlToImage TEXT NOT NULL,
        publishedAt TEXT NOT NULL
      )
      """);
  }

  Future<Database> _connectDatabase() async {
    return openDatabase(
      'news.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await _createTables(database);
      },
    );
  }

  Future<int> addToFavorite(Article article) async {
    final database = await _connectDatabase();

    final data = {
      'title': article.title,
      'description': article.description,
      'urlToImage': article.urlToImage,
      'publishedAt': article.publishedAt
    };
    final id = await database.insert('articles', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<Article>> getFavorites() async {
    final List<Article> articles = [];
    final database = await _connectDatabase();
    var response = await database.query('articles', orderBy: "id");

    await Future.forEach(
        response, (data) => articles.add(Article.fromJson(data)));

    return articles;
  }
}

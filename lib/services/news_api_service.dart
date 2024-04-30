import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalpas_task/models/api_response_model.dart';
import 'package:kalpas_task/models/article_model.dart';

class NewsApiService {
  final String _host = "newsapi.org";

  final String _apiKey = "8aa8f4f91bb5414cbe669cd59f08092a";

  Future<List<Article>> fetchEverythingNews() async {
    Map<String, dynamic> queryParameters = {
      "q": "india",
      "from": "2024-04-28",
      "sortBy": "publishedAt",
      "apiKey": _apiKey,
    };
    var url = Uri.https(_host, 'v2/everything', queryParameters);

    var response = await http.get(url);

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = jsonDecode(response.body);
        ApiResponse apiResponse = ApiResponse.fromJson(data);
        return apiResponse.articles ?? [];
      case 400:
      case 401:
      case 429:
      case 500:
        Map<String, dynamic> data = jsonDecode(response.body);
        ApiResponse apiResponse = ApiResponse.fromJson(data);
        throw Exception(apiResponse.message);

      default:
        throw Exception("Oops! Something went wrong beyond our expection.");
    }
  }
}

import 'package:kalpas_task/models/article_model.dart';

class ApiResponse {
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<Article>? articles;

  ApiResponse(
      {this.status, this.totalResults, this.code, this.message, this.articles});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json['message'];
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['code'] = code;
    data['message'] = message;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

import 'article.dart';

class News {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? code;
  String? message;

  News(
      {this.status, this.totalResults, this.articles, this.code, this.message});

  factory News.fromMap(Map<String, dynamic> data) => News(
        status: data['status'] as String?,
        code: data['code'] as String?,
        message: data['message'] as String?,
        totalResults: data['totalResults'] as int?,
        articles: (data['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toMap()).toList(),
      };
}

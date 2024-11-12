import 'package:alakhbar/domin/entity/TopHeadLines.dart';

class TopHeadLineResponseDto extends TopHeadLinesEntity {
  TopHeadLineResponseDto({
    super.status,
    super.totalResults,
    super.articles,
  });

  String? message;

  TopHeadLineResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
}

class Articles extends ArticlesEntity {
  Articles({
    super.source,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

class Source extends SourceEntity {
  Source({
    super.id,
    super.name,
  });

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}

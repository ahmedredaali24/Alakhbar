import 'package:alakhbar/domin/entity/NewsResponseEntity.dart';

class NewsResponseDto extends NewsResponseEntity {
  NewsResponseDto({
    super.status,
    super.totalResults,
    super.articles,
  });

  NewsResponseDto.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(NewsDto.fromJson(v));
      });
    }
  }
}

class NewsDto extends NewsEntity {
  NewsDto({
    super.source,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  NewsDto.fromJson(dynamic json) {
    source =
        json['source'] != null ? SourceNewsDto.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

class SourceNewsDto extends SourceNewsEntity {
  SourceNewsDto({
    super.id,
    super.name,
  });

  SourceNewsDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}

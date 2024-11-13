class NewsResponseEntity {
  NewsResponseEntity({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  num? totalResults;
  List<NewsEntity>? articles;
}

class NewsEntity {
  NewsEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  SourceNewsEntity? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
}

class SourceNewsEntity {
  SourceNewsEntity({
    this.id,
    this.name,
  });

  String? id;
  String? name;
}

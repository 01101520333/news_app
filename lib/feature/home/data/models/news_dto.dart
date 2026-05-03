import 'package:news_app/feature/home/domain/entities/news_entity.dart';

class NewsDto {
  String? status;
  int? totalResults;
  List<ArticleDto>? articles;

  NewsDto({this.status, this.totalResults, this.articles});

  NewsDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticleDto>[];
      json['articles'].forEach((v) {
        articles!.add(ArticleDto.fromJson(v));
      });
    }
  }
  NewsEntity toEntity() => NewsEntity(
    status: status ?? "",
    totalResults: totalResults ?? 0,
    articles: articles?.map((e) => e.toEntity()).toList() ?? [],
  );
}

class ArticleDto {
  String? sourceId;
  String? sourceName;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleDto({
    this.sourceId,
    this.sourceName,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  ArticleDto.fromJson(Map<String, dynamic> json) {
    sourceId = json['source']['id'];
    sourceName = json['source']['name'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  ArticleEntity toEntity() => ArticleEntity(
    sourceId: sourceId ?? "",
    sourceName: sourceName ?? "",
    author: author ?? "",
    title: title ?? "",
    description: description ?? "",
    url: url ?? "",
    urlToImage:
        urlToImage ??
        'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip',
    publishedAt: publishedAt ?? "",
    content: content ?? "",
  );
}

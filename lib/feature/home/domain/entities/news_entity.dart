class NewsEntity {
  const NewsEntity({
    this.status = "status",
    this.totalResults = 0,
    this.articles = const [],
  });

  final String status;
  final int totalResults;
  final List<ArticleEntity> articles;
}

class ArticleEntity {
  const ArticleEntity({
    this.sourceId = "source id",
    this.sourceName = "source Name",
    this.author = "author",
    this.title = "title",
    this.description = "description",
    this.url = "url",
    this.urlToImage = "url to image",
    this.publishedAt = "published at",
    this.content = "content",
  });

  final String sourceId;
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
}

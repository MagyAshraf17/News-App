class ArticlesModel {
  final String status;

  final List<Article> articles;

  ArticlesModel({required this.status, required this.articles});

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        status: json["status"],
        articles:
            // dy try2a ll list
            (json["articles"] as List)
                .map((data) => Article.fromJson(data))
                .toList(),
        //w dy try2a tany ll list
        // List.from(json["articles"])
        //     .map(
        //       (data) => Article.fromJson(data),
        //     )
        //     .toList(),
      );
}

class Article {
  // fy 8lta fl api auther lazm yrg3 b name
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["source"]["name"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        content: json["content"] ?? "",
      );
}

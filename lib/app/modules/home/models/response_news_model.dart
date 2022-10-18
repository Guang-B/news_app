class ResponseNewsModel {
  ResponseNewsModel({
     required this.status,
     required this.totalResults,
     required this.articles,});

  ResponseNewsModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = [];
    if (json['articles'] != null) {
      json['articles'].forEach((v) {
        articles.add(Articles.fromJson(v));
      });
    }
  }
 late String status;
 late int totalResults;
 late List<Articles> articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    map['articles'] = articles.map((v) => v.toJson()).toList();
    return map;
  }

}

class Articles {
  Articles({
     required this.source,
     required this.author,
     required this.title,
     required this.description,
     required this.url,
     required this.urlToImage,
     required this.publishedAt,
     required this.content,});

  Articles.fromJson(dynamic json) {
    source = Source.fromJson(json['source']);
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
 late Source source;
 late String? author;
 late String? title;
 late String? description;
 late String? url;
 late String? urlToImage;
 late String? publishedAt;
 late String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}

class Source {
  Source({
      required this.id,
    required this.name,});

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  late dynamic id;
  late String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}
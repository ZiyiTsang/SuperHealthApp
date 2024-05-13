import '../Article.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsResponse({this.status, this.totalResults, this.articles});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    try {
      status = json["status"];
      totalResults = json["totalResults"];
      articles = json["articles"] == null
          ? null
          : (json["articles"] as List).map((e) => Article.fromJson(e)).toList();
    } catch (e) {
      // 处理错误，比如打印错误信息或者设置默认值
      print("Error parsing JSON data: $e");
      // 设置默认值或者清空数据以避免进一步错误
      status = null;
      totalResults = null;
      articles = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["totalResults"] = totalResults;
    if (articles != null) {
      _data["articles"] = articles?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

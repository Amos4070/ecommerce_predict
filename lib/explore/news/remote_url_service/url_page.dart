import 'package:http/http.dart' as http;

import '../news_model/news_models.dart';

class RemoteNewsService {
  static var client = http.Client();

  static Future<List<NewsArticle>?> fetchNewsArticles() async {
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f7aed781c8864e5a9318d60151bf949b"));
    if (response.statusCode == 200) {
      return newsArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}

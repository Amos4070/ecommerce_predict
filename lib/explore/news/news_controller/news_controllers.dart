import 'package:get/get.dart';

import '../news_model/news_models.dart';
import '../remote_url_service/url_page.dart';

class NewsController extends GetxController {
  var newsArticles = <NewsArticle>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var articles = await RemoteNewsService.fetchNewsArticles();
      if (articles != null) {
        newsArticles(articles);
      }
    } finally {
      isLoading(false);
    }
  }
}

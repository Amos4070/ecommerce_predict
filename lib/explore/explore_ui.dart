import 'package:ecommerce_predict/explore/prediction/price_prediction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news/news_Card_View/new_card.dart';
import 'news/news_controller/news_controllers.dart';
import 'news/news_homepage_body.dart';

class ExploreLandingPage extends StatefulWidget {
  const ExploreLandingPage({Key? key}) : super(key: key);

  @override
  State<ExploreLandingPage> createState() => _ExploreLandingPageState();
}

class _ExploreLandingPageState extends State<ExploreLandingPage> {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                //todo let this be stable at news
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black38),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Center(
                  child: Text(
                    'News',
                    style: TextStyle(
                        color: Color(0xffF9D9D3),
                        fontSize: 30.0,
                        fontFamily: 'Horizon',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(
                  const Prediction(),
                  fullscreenDialog: true,
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 200),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black54),
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Center(
                  child: Text(
                    'Predictions',
                    style: TextStyle(
                        color: Color(0xffF9D9D3),
                        fontSize: 30.0,
                        fontFamily: 'Horizon',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //const Center(child: Text('Predictions')),
            ),
          ),
        ]),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 15.0, bottom: 15, left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Obx(
              () => newsController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 2,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: newsController.newsArticles.length,
                      itemBuilder: (context, index) => InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        title: newsController
                                            .newsArticles[index].title,
                                        description: newsController
                                            .newsArticles[index].description,
                                        imageUrl: newsController
                                                .newsArticles[index]
                                                .urlToImage ??
                                            "",
                                        author: newsController
                                                .newsArticles[index].author ??
                                            "",
                                        publishedAt: newsController
                                            .newsArticles[index].publishedAt
                                            .toString(),
                                        content: newsController
                                            .newsArticles[index].content,
                                      ))),
                          child: NewsCard(
                              title: newsController.newsArticles[index].title,
                              description: newsController
                                  .newsArticles[index].description,
                              imageUrl: newsController
                                      .newsArticles[index].urlToImage ??
                                  "",
                              author:
                                  newsController.newsArticles[index].author ??
                                      "",
                              publishedAt: newsController
                                  .newsArticles[index].publishedAt
                                  .toString())),
                    ),
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  final String description;
  final String publishedAt;
  final String author;
  final String imageUrl;
  final String content;
  const HomePage(
      {required this.title,
      required this.description,
      required this.publishedAt,
      required this.author,
      required this.imageUrl,
      required this.content});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Sliver app Bar
          SliverAppBar(
            title: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: const Icon(Icons.chevron_left, color: Colors.white),
                ),
              ),
            ),
            centerTitle: true,
            expandedHeight: 300,
            flexibleSpace: Stack(children: [
              FlexibleSpaceBar(
                background: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.black38, Colors.black],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter)
                      .createShader(bounds),
                  blendMode: BlendMode.darken,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.imageUrl))),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  top: 180,
                  right: 40,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.newspaper_sharp,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    widget.author,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  widget.publishedAt,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 8),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "News Content",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.content)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

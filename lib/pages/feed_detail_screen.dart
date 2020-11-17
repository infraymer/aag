import 'package:aag/models/feed.dart';
import 'package:aag/test_data.dart';
import 'package:aag/widgets/main_feed_widget.dart';
import 'package:aag/widgets/play_widget.dart';
import 'package:flutter/material.dart';

class FeedDetailScreen extends StatelessWidget {
  final MainFeed data;

  const FeedDetailScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) return SizedBox();

    final hMargin = EdgeInsets.symmetric(horizontal: 16);
    final isVideo = data.type == 'video';

    return Scaffold(
      body: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 222,
                color: Colors.black12,
                child: Image.network(
                  data.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              isVideo ? PlayWidget() : SizedBox(),
            ],
          ),
          ListView(
            children: [
              SizedBox(height: 200),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 22),
                    Container(
                      margin: hMargin,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                data.date,
                                style: TextStyle(color: Colors.black54),
                              ),
                              SizedBox(width: 16),
                              Row(
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    size: 16,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    data.viewing?.toString(),
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: hMargin,
                      child: Text(
                        data.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 22),
                    Container(
                      margin: hMargin,
                      child: Text(testDescription, style: TextStyle(fontSize: 16, height: 1.5),),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 1,
                      color: Colors.black12,
                    ),
                    SizedBox(height: 22),
                    MainFeedWidget(
                      data: MainFeed(
                        id: "0",
                        title:
                            "Роль коллагенопатий в развитии пролапса гениталий и недержания мочи у женщин",
                        date: "24.10.2020, 05:00",
                        type: 'article',
                        viewing: 120,
                        imageUrl:
                            'https://avatars.mds.yandex.net/get-zen_doc/1945572/pub_5d5fd0cf06cc4600ae1a4233_5d5fde4935ca3100ad26ab7e/scale_1200',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(8),
              child: BackButton(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

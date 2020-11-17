import 'package:aag/models/feed.dart';
import 'package:aag/pages/feed_detail_screen.dart';
import 'package:aag/widgets/header_feed_widget.dart';
import 'package:aag/widgets/main_drawer.dart';
import 'package:aag/widgets/main_feed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final data = <Feed>[
    HeaderFeed(),
    MainFeed(
      id: "0",
      title:
          "Роль коллагенопатий в развитии пролапса гениталий и недержания мочи у женщин",
      date: "24.10.2020, 05:00",
      type: 'article',
      viewing: 120,
      imageUrl:
          'https://avatars.mds.yandex.net/get-zen_doc/1945572/pub_5d5fd0cf06cc4600ae1a4233_5d5fde4935ca3100ad26ab7e/scale_1200',
    ),
    MainFeed(
      id: "1",
      title:
          "Грицкевич Е.Ю. - Эндокринологические предпосылки возникновения патологических состояний ЖКТ у беременных",
      date: "24.10.2020, 05:00",
      type: 'video',
      viewing: 56,
      imageUrl:
          'https://avatars.mds.yandex.net/get-zen_doc/1907561/pub_5d1ef9d0cbf26800ad3e6b02_5d1efae0c3337d00adbc5d0d/scale_1200',
    ),
    MainFeed(
      id: "2",
      title:
          "Роль коллагенопатий в развитии пролапса гениталий и недержания мочи у женщин",
      date: "24.10.2020, 05:00",
      type: 'article',
      viewing: 120,
      imageUrl:
          'https://avatars.mds.yandex.net/get-zen_doc/1945572/pub_5d5fd0cf06cc4600ae1a4233_5d5fde4935ca3100ad26ab7e/scale_1200',
    ),
    MainFeed(
      id: "3",
      title:
          "Роль коллагенопатий в развитии пролапса гениталий и недержания мочи у женщин",
      date: "24.10.2020, 05:00",
      type: 'article',
      viewing: 120,
      imageUrl:
          'https://avatars.mds.yandex.net/get-zen_doc/1945572/pub_5d5fd0cf06cc4600ae1a4233_5d5fde4935ca3100ad26ab7e/scale_1200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лента новостей'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: mainDrawer,
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];

          if (item is HeaderFeed) return HeaderFeedWidget();

          if (item is MainFeed)
            return GestureDetector(
              child: MainFeedWidget(data: item),
              onTap: () {
                Get.to(FeedDetailScreen(data: item));
              },
            );

          return SizedBox();
        },
      ),
    );
  }
}

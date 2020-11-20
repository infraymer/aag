import 'package:aag/models/feed.dart';
import 'package:aag/test_data.dart';
import 'package:aag/widgets/main_feed_widget.dart';
import 'package:aag/widgets/play_widget.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class FeedDetailScreen extends StatefulWidget {
  final MainFeed data;

  const FeedDetailScreen({Key key, this.data}) : super(key: key);

  @override
  _FeedDetailScreenState createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> initVideoController() async {
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) return SizedBox();

    final hMargin = EdgeInsets.symmetric(horizontal: 16);
    final isVideo = widget.data.type == 'video';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SafeArea(
                top: isVideo,
                child: Container(
                  width: double.infinity,
                  height: 222,
                  color: Colors.black12,
                  child: isVideo
                      ? FutureBuilder(
                          future: initVideoController(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot?.data ?? false)
                              return Chewie(
                                controller: chewieController,
                              );

                            return Center(child: CircularProgressIndicator());
                          },
                        )
                      : Image.network(widget.data.imageUrl, fit: BoxFit.cover),
                ),
              ),
              // isVideo ? PlayWidget() : SizedBox(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: !isVideo ? 0 : 240),
            child: ListView(
              children: [
                if (!isVideo) SizedBox(height: 222),
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
                                  widget.data.date,
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
                                      widget.data.viewing?.toString(),
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
                          widget.data.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 22),
                      Container(
                        margin: hMargin,
                        child: Text(
                          testDescription,
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
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
                              'https://help-yourself.ru/wp-content/uploads/2019/11/0-15.jpg',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SafeArea(
          //   child: Container(
          //     margin: EdgeInsets.all(8),
          //     child: BackButton(
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}

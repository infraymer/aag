import 'package:aag/models/feed.dart';
import 'package:aag/widgets/feed_type_widget.dart';
import 'package:aag/widgets/play_widget.dart';
import 'package:flutter/material.dart';

class MainFeedWidget extends StatelessWidget {
  final MainFeed data;

  const MainFeedWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) return SizedBox();

    final hMargin = EdgeInsets.symmetric(horizontal: 16);
    final isVideo = data.type == 'video';

    return Container(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 222,
                color: Colors.black12,
                child:
                    Image.network(
                      data.imageUrl,
                      fit: BoxFit.cover,
                    ),
              ),
              isVideo ? PlayWidget() : SizedBox(),
            ],
          ),
          SizedBox(height: 12),
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
                FeedTypeWidget(type: data.type),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: hMargin,
            child: Text(data.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          ),
          SizedBox(height: 22),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}

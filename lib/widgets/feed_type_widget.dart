import 'package:flutter/material.dart';

class FeedTypeWidget extends StatelessWidget {
  final String type;

  const FeedTypeWidget({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = getBgColor(type);
    final fgColor = getFgColor(type);
    final name = getText(type);

    if (name.isEmpty) return SizedBox();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: bgColor,
      ),
      child: Text(
        name?.toUpperCase(),
        style: TextStyle(
          color: fgColor,
        ),
      ),
    );
  }

  String getText(String type) {
    switch (type) {
      case 'article':
        return 'Статья';
      case 'video':
        return 'Видео';
      case 'news':
        return 'Новость';
      default:
        return '';
    }
  }

  Color getBgColor(String type) {
    switch (type) {
      case 'article':
        return Color(0xFF8E2221).withOpacity(0.12);
      case 'video':
        return Color(0xFF73AD00).withOpacity(0.2);
      case 'news':
        return Color(0xFFF77337).withOpacity(0.2);
      default:
        return Colors.black87;
    }
  }

  Color getFgColor(String type) {
    switch (type) {
      case 'article':
        return Color(0xFF8E2221);
      case 'video':
        return Color(0xFF73AD00);
      case 'news':
        return Color(0xFFF77337);
      default:
        return Colors.black12;
    }
  }
}

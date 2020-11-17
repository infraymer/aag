import 'package:flutter/material.dart';

class HeaderFeedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        'Сегодня',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

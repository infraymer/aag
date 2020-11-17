import 'package:flutter/material.dart';

class PlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: Colors.green
      ),
      child: Icon(Icons.play_arrow_rounded, size: 40, color: Colors.white),
    );
  }
}

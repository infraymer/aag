import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItemWidget({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.back();
            onTap?.call();
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(icon, color: Get.theme.primaryColor),
                SizedBox(width: 20),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64, right: 20),
          child: Container(
            height: 1,
            color: Colors.white12,
          ),
        ),
      ],
    );
  }
}
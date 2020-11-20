import 'package:aag/pages/article_screen.dart';
import 'package:aag/pages/main_screen.dart';
import 'package:aag/pages/video_screen.dart';
import 'package:aag/widgets/drawer_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final mainDrawer = Drawer(
  child: Container(
    color: Color(0xFF33313A),
    child: SafeArea(
      child: ListView(
        children: [
          DrawerItemWidget(
            icon: Icons.home,
            title: 'Лента новостей',
            onTap: () {
              Get.off(MainScreen());
            },
          ),
          DrawerItemWidget(
            icon: Icons.list,
            title: 'Статьи',
            onTap: () {
              Get.off(ArticleScreen());
            },
          ),
          DrawerItemWidget(
            icon: Icons.receipt,
            title: 'Мероприятия',
          ),
          DrawerItemWidget(
            icon: Icons.calendar_today_rounded,
            title: 'Календарь встреч',
          ),
          DrawerItemWidget(
            icon: Icons.video_collection_outlined,
            title: 'Видео',
            onTap: () {
              Get.off(VideoScreen());
            },
          ),
          DrawerItemWidget(
            icon: Icons.star_rate_outlined,
            title: 'Избранное',
          ),
          DrawerItemWidget(
            icon: Icons.settings,
            title: 'Настройки',
          ),
        ],
      ),
    ),
  ),
);
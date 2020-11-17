class Feed {}
class MainFeed extends Feed {
  final String id;
  final String imageUrl;
  final String title;
  final String type;
  final int viewing;
  final String date;

  MainFeed({this.id, this.imageUrl, this.title, this.type, this.viewing, this.date});
}
class HeaderFeed extends Feed {}
abstract class ApodEntity {
  ApodEntity({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    this.mediaType,
    required this.title,
    this.url,
  });
  String copyright;
  String date;
  String explanation;
  String hdurl;
  String? mediaType;
  String title;
  String? url;
}

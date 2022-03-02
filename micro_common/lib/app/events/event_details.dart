import 'package:event_bus/event_bus.dart';

class EventDatails extends IEventBus {
  String? copyright;
  String date;
  String explanation;
  String hdurl;
  String? mediaType;
  String title;
  String? url;

  EventDatails({
    this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    this.mediaType,
    required this.title,
    this.url,
  });
}

import 'package:micro_common/app/events/event_details.dart';

class ApodEntity {
  String? copyright;
  String date;
  String explanation;
  String hdurl;
  String? mediaType;
  String title;
  String? url;
  ApodEntity({
    this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    this.mediaType,
    required this.title,
    this.url,
  });

  ApodEntity copyWith({
    String? copyright,
    String? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? title,
    String? url,
  }) {
    return ApodEntity(
      copyright: copyright ?? this.copyright,
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  EventDatails get eventDatails {
    return EventDatails(
      copyright: copyright,
      date: date,
      explanation: explanation,
      hdurl: hdurl,
      mediaType: mediaType,
      title: title,
      url: url,
    );
  }
}

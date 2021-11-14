import 'dart:convert';

import 'package:micro_common/app/domain/entity/apod_entity.dart';

class ApodModel extends ApodEntity {
  ApodModel({
    required String copyright,
    required String date,
    required String explanation,
    required String hdurl,
    String? mediaType,
    required String title,
    String? url,
  }) : super(
          copyright: copyright,
          date: date,
          explanation: explanation,
          hdurl: hdurl,
          mediaType: mediaType,
          title: title,
          url: url,
        );

  Map<String, dynamic> toMap() {
    return {
      'copyright': copyright,
      'date': date,
      'explanation': explanation,
      'hdurl': hdurl,
      'mediaType': mediaType,
      'title': title,
      'url': url,
    };
  }

  factory ApodModel.fromMap(Map<String, dynamic> map) {
    return ApodModel(
      copyright: map['copyright'],
      date: map['date'],
      explanation: map['explanation'],
      hdurl: map['hdurl'],
      mediaType: map['mediaType'] != null ? map['mediaType'] : null,
      title: map['title'],
      url: map['url'] != null ? map['url'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApodModel.fromJson(String source) =>
      ApodModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ApodEntity(copyright: $copyright, date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, title: $title, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApodEntity &&
        other.copyright == copyright &&
        other.date == date &&
        other.explanation == explanation &&
        other.hdurl == hdurl &&
        other.mediaType == mediaType &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode {
    return copyright.hashCode ^
        date.hashCode ^
        explanation.hashCode ^
        hdurl.hashCode ^
        mediaType.hashCode ^
        title.hashCode ^
        url.hashCode;
  }
}

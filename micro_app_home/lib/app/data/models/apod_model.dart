import 'package:micro_app_home/app/domain/entity/apod_entity.dart';

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

  factory ApodModel.fromJson(Map<String, dynamic> json) {
    return ApodModel(
      copyright: json['copyright'],
      date: json['date'],
      explanation: json['explanation'],
      mediaType: json['media_type'],
      hdurl: json['hdurl'],
      title: json['title'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'copyright': copyright,
      'date': date,
      'explanation': explanation,
      'hdurl': hdurl,
      'media_type': mediaType,
      'title': title,
      'url': url,
    };
  }
}

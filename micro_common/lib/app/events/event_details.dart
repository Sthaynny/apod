import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class EventDatails extends IEventBus {
  BuildContext context;
  String? copyright;
  String date;
  String explanation;
  String hdurl;
  String? mediaType;
  String title;
  String? url;

  EventDatails({
    required this.context,
    this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    this.mediaType,
    required this.title,
    this.url,
  });
}

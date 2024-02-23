import 'package:flutter/material.dart';

class NotificationModel {
  const NotificationModel({
    required this.profilePic,
    required this.title,
    required this.description,
    required this.time,
  });

  final String profilePic;
  final String title;
  final String description;
  final TimeOfDay time;
}

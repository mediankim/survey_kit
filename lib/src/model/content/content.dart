import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/model/content/audio_content.dart';
import 'package:survey_kit/src/model/content/lottie_content.dart';
import 'package:survey_kit/src/model/content/markdown_content.dart';
import 'package:survey_kit/src/model/content/text_content.dart';
import 'package:survey_kit/src/model/content/video_content.dart';

@JsonSerializable()
abstract class Content {
  @JsonKey(includeIfNull: false)
  final String? id;

  const Content({this.id});

  factory Content.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String?;
    assert(type != null, 'type is required');

    switch (type) {
      case 'audio':
        return AudioContent.fromJson(json);
      case 'text':
        return TextContent.fromJson(json);
      case 'video':
        return VideoContent.fromJson(json);
      case 'markdown':
        return MarkdownContent.fromJson(json);
      case 'lottie':
        return LottieContent.fromJson(json);
      default:
        throw Exception('Unknown type: $type');
    }
  }

  Widget createWidget();
}

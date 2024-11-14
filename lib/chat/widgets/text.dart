import 'package:flutter/material.dart';

class TitleText extends StatefulWidget {
  final String title;

  const TitleText({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14, color: Colors.white),
    );
  }
}

class SubtitleText extends StatefulWidget {
  final String subtitleText;
  final Color? subtitleTextColor;

  const SubtitleText({
    super.key,
    required this.subtitleText,
    this.subtitleTextColor,
  });

  @override
  State<StatefulWidget> createState() => _SubtitleTextState();
}

class _SubtitleTextState extends State<SubtitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.subtitleText,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 12, color: widget.subtitleTextColor ?? Colors.grey),
    );
  }
}

class TimeText extends StatefulWidget {
  final String time;

  const TimeText({super.key, required this.time});

  @override
  State<StatefulWidget> createState() => _TimeTextState();
}

class _TimeTextState extends State<TimeText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.time,
      style: const TextStyle(
        fontSize: 8,
        color: Colors.grey,
      ),
    );
  }
}

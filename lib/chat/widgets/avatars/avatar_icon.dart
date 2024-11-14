import 'package:flutter/material.dart';

class AvatarIcon extends StatefulWidget {
  final String iconLink;

  const AvatarIcon({
    super.key,
    required this.iconLink,
  });

  @override
  State<StatefulWidget> createState() => _AvatarIconState();
}

class _AvatarIconState extends State<AvatarIcon> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundImage: AssetImage(widget.iconLink),
    );
  }
}

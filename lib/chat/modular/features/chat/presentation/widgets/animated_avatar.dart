import 'package:flutter/material.dart';

class AnimatedAvatar extends StatefulWidget {
  const AnimatedAvatar({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<StatefulWidget> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<AnimatedAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.5, end: 1.0).animate(_controller),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(widget.imageUrl),
      ),
    );
  }
}

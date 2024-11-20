import 'package:flutter/material.dart';

class AnimatedBackIcon extends StatefulWidget {
  const AnimatedBackIcon({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedBackIconState();
}

class _AnimatedBackIconState extends State<AnimatedBackIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 2.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: animation,
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedMenuIcon extends StatefulWidget {
  const AnimatedMenuIcon({super.key, required this.icon});

  final IconData icon;

  @override
  State<StatefulWidget> createState() => _AnimatedMenuIconState();
}

class _AnimatedMenuIconState extends State<AnimatedMenuIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -0.2, end: 0.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCirc,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0.0,
            -20.0 * _animation.value,
          ),
          child: child,
        );
      },
      child: Icon(widget.icon),
    );
  }
}

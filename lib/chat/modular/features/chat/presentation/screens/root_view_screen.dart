import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../theme/colors.dart';
import 'chat_screen.dart';

class RootViewScreen extends StatefulWidget {
  const RootViewScreen({super.key});

  @override
  State<RootViewScreen> createState() => _RootViewScreenState();
}

class _RootViewScreenState extends State<RootViewScreen> {
  final double _screenWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkThemeColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                Container(
                  width: _screenWidth,
                  decoration:
                      const BoxDecoration(border: Border(right: BorderSide())),
                  child:
                      SizedBox(width: _screenWidth, child: const ChatsScreen()),
                ),
                const Expanded(child: RouterOutlet()),
              ],
            );
          } else {
            return const Expanded(child: ChatsScreen());
          }
        },
      ),
    );
  }
}

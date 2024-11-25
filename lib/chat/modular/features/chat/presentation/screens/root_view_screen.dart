import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../theme/colors.dart';
import '../../../bottom_bar_navigation.dart';
import '../state/app_theme_mode_state.dart';
import '../state/cubits/app_theme_cubit.dart';

class RootViewScreen extends StatefulWidget {
  const RootViewScreen({super.key});

  @override
  State<RootViewScreen> createState() => _RootViewScreenState();
}

class _RootViewScreenState extends State<RootViewScreen> {
  final double _screenWidth = 300;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeModeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.isDark == true
              ? AppColors.darkPrimaryColor
              : AppColors.primaryColor,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  children: [
                    Container(
                      width: _screenWidth,
                      decoration: const BoxDecoration(
                        border: Border(right: BorderSide()),
                      ),
                      child: SizedBox(
                        width: _screenWidth,
                        child: const BottomNavigation(),
                      ),
                    ),
                    const Expanded(child: RouterOutlet()),
                  ],
                );
              } else {
                return const Expanded(child: BottomNavigation());
              }
            },
          ),
        );
      },
    );
  }
}

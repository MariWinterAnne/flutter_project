import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/custom_theme.dart';
import '../../../settings/presentation/state/cubits/app_theme_cubit.dart';
import '../state/cubits/chat_details_cubit.dart';
import '../state/details_screen_state.dart';
import '../widgets/animated_back_icon.dart';
import '../widgets/details/details_screen_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const _unmute = 'Unmute';
  static const _snackbarText = 'This is a snackbar';

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppThemeCubit>().state;
    return MaterialApp(
      themeMode: state.isDark == true ? ThemeMode.dark : ThemeMode.light,
      darkTheme: CustomTheme.darkTheme,
      theme: CustomTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context, false),
            icon: const AnimatedBackIcon(),
          ),
          title: BlocBuilder<ChatDetailsCubit, DetailsScreenState>(
            builder: (context, state) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(state.currentChat.linkUrl),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.currentChat.title),
                      Text(
                        state.currentChat.subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.greyColor,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(_snackbarText)),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(_snackbarText)),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ChatDetailsCubit, DetailsScreenState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(left: 8),
              child: CardView(element: state.currentChat),
            );
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _unmute,
                  style: TextStyle(color: AppColors.elementsColor),
                ),
              ],
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(_snackbarText)),
              );
            },
          ),
        ),
      ),
    );
  }
}

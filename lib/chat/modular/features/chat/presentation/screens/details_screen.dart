import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../main.dart';
import '../../../../../theme/colors.dart';
import '../state/cubits/chat_details_cubit.dart';
import '../state/details_screen_state.dart';
import '../widgets/details/details_screen_card.dart';
import '../widgets/text.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: appTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkThemeColor,
          leading: IconButton(
            color: AppColors.elementsColor,
            onPressed: () => Navigator.pop(context, false),
            icon: const Icon(Icons.arrow_back),
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
                      TitleText(title: state.currentChat.title),
                      SubtitleText(subtitleText: state.currentChat.subtitle),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            IconButton(
              color: AppColors.elementsColor,
              icon: const Icon(Icons.search),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              color: AppColors.elementsColor,
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
        ),
        body: BlocBuilder<ChatDetailsCubit, DetailsScreenState>(
          builder: (context, state) {
            return CardView(
              title: state.currentChat.title,
              subtitle: state.currentChat.subtitle,
              link: state.currentChat.linkUrl,
              cardImageLink: state.currentChat.cardImageLink,
              text: state.currentChat.text,
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: AppColors.darkThemeColor,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Unmute',
                  style: TextStyle(color: AppColors.elementsColor),
                ),
              ],
            ),
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Do something')));
            },
          ),
        ),
      ),
    );
  }
}

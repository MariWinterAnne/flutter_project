import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../theme/colors.dart';
import '../../../../../widgets/details/details_screen_card.dart';
import '../../../../../widgets/text.dart';
import '../repository/feed_repository.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final repository = Modular.get<FeedRepository>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkThemeColor,
        leading: BackButton(
          color: AppColors.elementsColor,
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(repository.getData().chatDataList[1].linkUrl),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(title: repository.getData().chatDataList[1].title),
                SubtitleText(subtitleText: repository.getData().chatDataList[1].subtitle),
              ],
            ),
          ],
        ),
        actions: [
          Flexible(
            child: IconButton(
              color: AppColors.elementsColor,
              icon: const Icon(Icons.search),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ),
          Flexible(
            child: IconButton(
              color: AppColors.elementsColor,
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ),
        ],
      ),
      body: CardView(
        title: repository.getData().chatDataList[1].title,
        subtitle: repository.getData().chatDataList[1].subtitle,
        link: repository.getData().chatDataList[1].linkUrl,
        cardImageLink: repository.getData().chatDataList[1].cardImageLink,
        text: repository.getData().chatDataList[1].text,
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.darkThemeColor,
        child: GestureDetector(
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
    );
  }
}

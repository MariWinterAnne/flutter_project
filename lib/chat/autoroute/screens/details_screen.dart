import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../modular/features/chat/domain/models/chat_data_list_model.dart';
import '../../modular/features/chat/presentation/widgets/details/details_screen_card.dart';
import '../../modular/features/chat/presentation/widgets/text.dart';
import '../../theme/colors.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.chatElement,
  });

  final ChatDataListModel chatElement;

  @override
  State<StatefulWidget> createState() => _DetailsScreenViewState();
}

class _DetailsScreenViewState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
              backgroundImage: AssetImage(widget.chatElement.linkUrl),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(title: widget.chatElement.title),
                SubtitleText(subtitleText: widget.chatElement.subtitle),
              ],
            ),
          ],
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
      body: CardView(
        title: widget.chatElement.title,
        subtitle: widget.chatElement.subtitle,
        link: widget.chatElement.linkUrl,
        cardImageLink: widget.chatElement.cardImageLink,
        text: widget.chatElement.text,
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

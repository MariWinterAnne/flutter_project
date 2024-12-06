import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/cubits/chats_cubit.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final controller = TextEditingController();
  static const _search = 'Search';
  bool showSuffix = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        showSuffix = true;
      } else {
        showSuffix = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, size: 14),
        suffixIcon: showSuffix
            ? IconButton(
                icon: const Icon(Icons.close, size: 14),
                onPressed: () {
                  context.read<ChatsCubit>().getFilteredData(null);
                  controller.clear();
                  FocusScope.of(context).unfocus();
                },
              )
            : null,
        border: const OutlineInputBorder(),
        hintText: _search,
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      controller: controller,
      onChanged: (value) {
        context.read<ChatsCubit>().getFilteredData(value);
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final controller = TextEditingController();
  static const _search = 'Search';

  @override
  void initState() {
    super.initState();
    controller.addListener(_searchText);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _searchText() {
    if (kDebugMode) {
      print(controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(),
        hintText: _search,
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      controller: controller,
    );
  }
}

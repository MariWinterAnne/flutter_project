import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final controller = TextEditingController();

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
    return Container(
      color: AppColors.secondaryColor,
        child: TextField(
          style: const TextStyle(fontSize: 12, color: Colors.white),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            hintText: 'Search',
          ),
          controller: controller,
        ),
    );
  }
}

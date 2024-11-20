import 'package:flutter/material.dart';

class ListDropdown extends StatefulWidget {
  const ListDropdown({super.key});

  @override
  State<ListDropdown> createState() => _DropdownList();
}

class _DropdownList extends State<ListDropdown> {
  static const List<String> os = ['iOS', 'Android', 'Mac', 'Linux', 'Windows'];
  String selectedValue = os.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: selectedValue,
      dropdownMenuEntries: os.map<DropdownMenuEntry<String>>(
        (String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        },
      ).toList(),
      onSelected: (String? value) {
        setState(
          () {
            selectedValue = value!;
          },
        );
      },
    );
  }
}

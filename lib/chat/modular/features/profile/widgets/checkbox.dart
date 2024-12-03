import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class Os {
  String text;
  bool value;

  Os({
    required this.text,
    this.value = false,
  });
}

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({super.key});

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  final selectAll = Os(text: 'Select All');
  final elements = [
    Os(text: 'Android'),
    Os(text: 'iOS'),
    Os(text: 'Mac'),
    Os(text: 'Windows'),
    Os(text: 'Linux'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CheckboxListTile(
            title: Text(
              selectAll.text,
              style: const TextStyle(fontSize: 16),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            value: selectAll.value,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                selectAll.value = value;
                for (var element in elements) {
                  element.value = value;
                }
              });
            }),
        const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        ...elements.map((customCheckListTile))
      ],
    );
  }

  Widget customCheckListTile(Os element) {
    return CheckboxListTile(
      activeColor: AppColors.elementsColor,
      title: Text(
        element.text,
        style: const TextStyle(fontSize: 16),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: element.value,
      onChanged: (value) {
        setState(
          () {
            element.value = value!;
            selectAll.value = elements.every((element) => element.value);
          },
        );
      },
    );
  }
}

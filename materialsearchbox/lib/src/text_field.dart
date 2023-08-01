import 'package:flutter/material.dart';

class TextFieldSearchBar extends StatelessWidget {
  const TextFieldSearchBar({super.key, required this.onChanged, this.hintText = 'Search'});
  final void Function(String) onChanged;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
      ),
      onChanged: onChanged,
    );
  }
}

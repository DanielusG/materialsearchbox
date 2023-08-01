import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:materialsearchbox/src/text_field.dart';

class MaterialSearchBox extends StatelessWidget {
  const MaterialSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldSearchBar()
        
      ],
    );
  }
}

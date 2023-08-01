import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:materialsearchbox/src/result_box.dart';
import 'package:materialsearchbox/src/text_field.dart';

class MaterialSearchBox extends StatefulWidget {
  const MaterialSearchBox(
      {super.key,
      this.maxHeight = 200,
      this.width = 200,
      required this.onSearch,
      this.onSelected,
      this.itemBuilder})
      : assert(maxHeight > 0),
        assert(width > 0),
        // onSelected and itemBuilder can't be non-null at the same time;
        assert(onSelected == null || itemBuilder == null);

  /// The maximum height of the result box
  final double maxHeight;

  /// The width of the search box
  final double width;

  /// The function that will be called when the user types in the search box
  final List<String> Function(String) onSearch;

  /// The function that will be called when the user selects an item from the result box
  final void Function(int index, String value)? onSelected;

  /// Item builder for the result box
  /// 
  /// if this is not null, [onSelected] must be null and handle the selection in the [itemBuilder]
  final Widget Function(BuildContext context, int index, String value)?
      itemBuilder;
  @override
  State<MaterialSearchBox> createState() => _MaterialSearchBoxState();
}

class _MaterialSearchBoxState extends State<MaterialSearchBox> {
  List<String> data = [];
  @override
  void initState() {
    data = widget.onSearch('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        children: [
          TextFieldSearchBar(
            onChanged: (value) {
              setState(() {
                data = widget.onSearch(value);
              });
            },
          ),
          ResultBox(
            data: data,
            maxHeight: widget.maxHeight,
            onSelected: widget.onSelected,
            itemBuilder: widget.itemBuilder,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:materialsearchbox/src/item.dart';
import 'package:materialsearchbox/src/result_box.dart';
import 'package:materialsearchbox/src/text_field.dart';

class MaterialSearchBox<T> extends StatefulWidget {
  const MaterialSearchBox(
      {Key? key,
      this.maxHeight = 200,
      this.width = 200,
      required this.onSearch,
      this.onSelected,
      this.itemBuilder})
      : assert(maxHeight > 0),
        assert(width > 0),
        // onSelected and itemBuilder can't be non-null at the same time;
        assert(onSelected == null || itemBuilder == null),
        super(key: key);

  /// The maximum height of the result box
  final double maxHeight;

  /// The width of the search box
  final double width;

  /// The function that will be called when the user types in the search box
  final Future<List<Item<T>>> Function(String) onSearch;

  /// The function that will be called when the user selects an item from the result box
  final void Function(int index, Item<T> item)? onSelected;

  /// Item builder for the result box
  /// 
  /// if this is not null, [onSelected] must be null and handle the selection in the [itemBuilder]
  final Widget Function(BuildContext context, int index, Item<T> item)?
      itemBuilder;
  @override
  State<MaterialSearchBox<T>> createState() => _MaterialSearchBoxState<T>();
}

class _MaterialSearchBoxState<T> extends State<MaterialSearchBox<T>> {
  List<Item<T>> data = [];
  @override
  void initState() {
    widget.onSearch('').then((List<Item<dynamic>> value) => setState(() => data = value as List<Item<T>>));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        children: [
          TextFieldSearchBar(
            onChanged: (value) async{
              data = await widget.onSearch(value);
              setState(() {
                
              });
            },
          ),
          ResultBox<T>(
            data: data,
            maxHeight: widget.maxHeight,
            onSelected: widget.onSelected == null ? null : (index, item) => widget.onSelected!(index, item),
            itemBuilder: widget.itemBuilder,
          )
        ],
      ),
    );
  }
}

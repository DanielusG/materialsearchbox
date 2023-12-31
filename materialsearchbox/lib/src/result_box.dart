import 'package:flutter/material.dart';
import 'package:materialsearchbox/src/item.dart';

class ResultBox<T> extends StatelessWidget {
  const ResultBox(
      {super.key,
      required this.data,
      required this.maxHeight,
      required this.onSelected,
      required this.itemBuilder});
  final List<Item<T>> data;
  final double maxHeight;
  final void Function(int index, Item<T> item)? onSelected;
  final Widget Function(BuildContext context, int index, Item<T> value)?
      itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              if (itemBuilder != null) {
                return itemBuilder!(context, index, data[index]);
              }
              return ElevatedButton(
                  onPressed: () {
                    onSelected?.call(index, data[index]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                  child: Text(data[index].name));
            }),
      ),
    );
  }
}

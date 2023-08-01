import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key, required this.data});
  final List<String> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          tileColor: Theme.of(context).cardColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Text('Item $index'),
        );
      }),
    );
  }
}

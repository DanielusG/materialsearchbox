import 'package:flutter/material.dart';
import 'package:materialsearchbox/materialsearchbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo search box',
      theme: ThemeData.light(useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
    'San Antonio',
    'San Diego',
    'Dallas',
    'San Jose',
    'Austin',
    'Jacksonville',
    'Rome',
    'Milan',
    'Naples',
    'Turin',
    'Palermo',
    'Genoa',
    'Bologna',
    'Florence',
    'Fiumicino',
    'Catania',
    'Venice',
    'Verona',
    'Messina',
    'Padua',
  ];
  Future<List<Item<String>>> onSearch(String value) async {
    List<Item<String>> result = [];
    for (String item in cities) {
      if (item.toLowerCase().contains(value.toLowerCase())) {
        result.add(Item(item, item));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Search for a city:',
            ),
            MaterialSearchBox<String>(
              width: 400,
              onSearch: onSearch,
              onSelected: (index, value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

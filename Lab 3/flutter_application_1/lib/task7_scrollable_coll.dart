import 'package:flutter/material.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({Key? key}) : super(key: key);

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  // Exercise 7.1: a list of 20 items
  List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 7: ListView')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          // Exercise 7.2: Dismissible lets the user swipe the item away
          return Dismissible(
            key: Key(item), // every item needs a unique key
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$item deleted')),
              );
            },
            child: ListTile(
              leading: const Icon(Icons.label),
              title: Text(item),
              subtitle: const Text('Swipe to delete'),
            ),
          );
        },
      ),
    );
  }
}
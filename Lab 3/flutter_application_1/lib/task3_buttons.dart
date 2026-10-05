import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 3: Buttons')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter value:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8.0),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            // Exercise 3.2: OutlinedButton resets the counter to 0
            OutlinedButton(
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
      // Exercise 3.1: FloatingActionButton increments the counter
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
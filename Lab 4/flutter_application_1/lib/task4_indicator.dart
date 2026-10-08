import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  bool isLoading = false;
  String statusText = 'Nothing saved yet';

  Future<void> startLoading() async {
    // Show the loading circle
    setState(() {
      isLoading = true;
    });

    // Wait for 3 seconds (pretending to do some work)
    await Future.delayed(const Duration(seconds: 3));

    // Stop if the user left the screen while waiting
    if (!mounted) return;

    setState(() {
      isLoading = false;
      statusText = 'Data saved';
    });

    // Exercise 4.2: SnackBar with an Undo action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Data saved successfully'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              statusText = 'Save undone';
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 4: Indicators')),
      body: Center(
        // Exercise 4.1: show the circle while loading, otherwise show the button
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(statusText, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: startLoading,
                    child: const Text('Save Data'),
                  ),
                ],
              ),
      ),
    );
  }
}
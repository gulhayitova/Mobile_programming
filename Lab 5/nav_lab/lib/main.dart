import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: StepScreen(step: 1)));

class StepScreen extends StatelessWidget {
  final int step;
  const StepScreen({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final isLast = step == 4;
    return Scaffold(
      appBar: AppBar(title: Text('Step $step')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('This is step $step of 4', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text(isLast ? 'Finish' : 'Next'),
              onPressed: () {
                if (isLast) {
                  // Remove Steps 2-4 at once, keep only the first route.
                  Navigator.popUntil(context, (route) => route.isFirst);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StepScreen(step: step + 1),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
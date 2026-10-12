import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: RootScreen()));

/// Shows "Back" if there is something to pop, otherwise it is disabled.
class BackOrExitButton extends StatelessWidget {
  const BackOrExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    return ElevatedButton(
      onPressed: canPop ? () => Navigator.pop(context) : null,
      child: Text(canPop ? 'Back' : 'Nothing to go back to'),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Root screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BackOrExitButton(), // disabled: nothing to pop
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Open pushed screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PushedScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PushedScreen extends StatelessWidget {
  const PushedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pushed screen')),
      body: const Center(child: BackOrExitButton()), // enabled: can pop
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _value = 0;

  Future<void> _edit() async {
    final result = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (context) => EditorScreen(initial: _value)),
    );
    if (!mounted) return;
    // Back arrow / system back gives null: keep the old value.
    if (result != null) {
      setState(() => _value = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Value: $_value', style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _edit, child: const Text('Edit')),
          ],
        ),
      ),
    );
  }
}

class EditorScreen extends StatefulWidget {
  final int initial;
  const EditorScreen({super.key, required this.initial});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late int _value = widget.initial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editor')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$_value', style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _value--),
                  child: const Text('-'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => setState(() => _value++),
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, _value),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
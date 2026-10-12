import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.grey;

  Future<void> _choose() async {
    final c = await Navigator.push<Color>(
      context,
      MaterialPageRoute(builder: (context) => const ChooseColourScreen()),
    );
    if (!mounted) return;
    if (c != null) setState(() => _color = c);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 150, height: 150, color: _color),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _choose,
              child: const Text('Choose colour'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseColourScreen extends StatelessWidget {
  const ChooseColourScreen({super.key});

  Widget _button(BuildContext context, String label, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: const Size(160, 48),
      ),
      onPressed: () => Navigator.pop(context, color),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose colour')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _button(context, 'Red', Colors.red),
            const SizedBox(height: 12),
            _button(context, 'Green', Colors.green),
            const SizedBox(height: 12),
            _button(context, 'Blue', Colors.blue),
          ],
        ),
      ),
    );
  }
}
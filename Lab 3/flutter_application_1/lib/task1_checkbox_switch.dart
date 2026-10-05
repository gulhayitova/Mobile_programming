import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          // Exercise 1.1: Switch for Dark Mode
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),

          // Exercise 1.1: Checkbox for Agree to Terms
          CheckboxListTile(
            title: const Text('Agree to Terms'),
            value: agreedToTerms,
            onChanged: (value) {
              setState(() {
                agreedToTerms = value ?? false;
              });
            },
          ),

          const SizedBox(height: 16.0),

          // Exercise 1.2: Button is enabled only if the checkbox is checked
          // (onPressed: null makes the button disabled)
          ElevatedButton(
            onPressed: agreedToTerms
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Terms accepted!')),
                    );
                  }
                : null,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: SettingsScreen(),
    ),
  );
}
import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  const Contact(this.name, this.phone, this.email);
}

const contacts = [
  Contact('Aziza Karimova', '+998 90 123 45 67', 'aziza@example.com'),
  Contact('Bobur Rakhimov', '+998 91 234 56 78', 'bobur@example.com'),
  Contact('Dilnoza Yusupova', '+998 93 345 67 89', 'dilnoza@example.com'),
  Contact('Jasur Tashkentov', '+998 94 456 78 90', 'jasur@example.com'),
  Contact('Malika Sodiqova', '+998 97 567 89 01', 'malika@example.com'),
];

void main() => runApp(const MaterialApp(home: ContactListScreen()));

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView(
        children: [
          for (final c in contacts)
            ListTile(
              leading: CircleAvatar(child: Text(c.name[0])),
              title: Text(c.name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactScreen(contact: c),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;
  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.name,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 8),
                  Text(contact.phone),
                ]),
                const SizedBox(height: 8),
                Row(children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 8),
                  Text(contact.email),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
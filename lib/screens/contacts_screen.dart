import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final List<String> _contacts = ['Mom: +91 1234567890', 'Friend: +91 9876543210'];
  final TextEditingController _contactController = TextEditingController();

  void _addContact() {
    if (_contactController.text.isNotEmpty) {
      setState(() {
        _contacts.add(_contactController.text);
        _contactController.clear();
      });
    }
  }

  void _removeContact(int index) {
    setState(() => _contacts.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Contacts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _contactController,
              decoration: const InputDecoration(
                labelText: 'Add Contact (Name: Number)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addContact,
              child: const Text('Add Contact'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_contacts[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeContact(index),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

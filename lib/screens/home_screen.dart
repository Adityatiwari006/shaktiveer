import 'package:flutter/material.dart';
import 'sos_screen.dart';
import 'contacts_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to ShaktiVeer')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Your Safety Toolkit', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const SosScreen()));
              },
              icon: const Icon(Icons.warning_amber_rounded),
              label: const Text('SOS Emergency'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ContactsScreen()));
              },
              icon: const Icon(Icons.contacts),
              label: const Text('Emergency Contacts'),
            ),
            const SizedBox(height: 20),
            const Text('Shake Alert: Enabled\n(Default: 3 Shakes)',
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
            const Icon(Icons.vibration, color: Colors.pink, size: 50),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Shake alert simulated!')),
                );
              },
              child: const Text('Simulate Shake Alert'),
            ),
          ],
        ),
      ),
    );
  }
}

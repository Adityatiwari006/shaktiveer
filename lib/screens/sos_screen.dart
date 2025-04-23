import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/location_service.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  void _sendSosAlert(BuildContext context) async {
    final location = await LocationService.getCurrentLocation();
    Fluttertoast.showToast(
      msg: "SOS sent with location:\nLat: ${location.latitude}, Long: ${location.longitude}",
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
    );
    // Simulate sending message to contacts (to be implemented with backend)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SOS Emergency')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tap to Send SOS Alert', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.sos, size: 30),
              label: const Text('Send SOS'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () => _sendSosAlert(context),
            )
          ],
        ),
      ),
    );
  }
}

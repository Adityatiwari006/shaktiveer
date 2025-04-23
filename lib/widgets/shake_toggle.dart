import 'package:flutter/material.dart';

class ShakeToggle extends StatefulWidget {
  final void Function(int) onShakeTriggered;
  const ShakeToggle({super.key, required this.onShakeTriggered});

  @override
  State<ShakeToggle> createState() => _ShakeToggleState();
}

class _ShakeToggleState extends State<ShakeToggle> {
  int shakeCount = 3;

  void simulateShake() {
    widget.onShakeTriggered(shakeCount);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Simulated shake ($shakeCount times)! SOS Triggered.'),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Shake Count to Trigger Alert:"),
        Slider(
          min: 1,
          max: 10,
          value: shakeCount.toDouble(),
          divisions: 9,
          label: shakeCount.toString(),
          onChanged: (value) {
            setState(() {
              shakeCount = value.toInt();
            });
          },
        ),
        ElevatedButton.icon(
          onPressed: simulateShake,
          icon: const Icon(Icons.vibration),
          label: const Text('Simulate Shake Alert'),
        )
      ],
    );
  }
}

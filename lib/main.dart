import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'services/app_state.dart';

void main() {
  runApp(const ShaktiVeerApp());
}

class ShaktiVeerApp extends StatelessWidget {
  const ShaktiVeerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShaktiVeer - Women Safety',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: const Color(0xFFFFF0F5),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


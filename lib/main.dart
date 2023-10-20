import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'hooks_fizzbuzz.dart';
import 'normal_fizzbuzz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_hooks practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const RootPage(),
        '/normal': (_) => const NormalFizzBuzzPage(),
        '/hooks': (_) => const HooksFizzBuzzPage()
      },
    );
  }
}

class RootPage extends HookWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/normal'),
                child: const Text('navigate to normal page'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/hooks'),
                child: const Text('navigate to hooks page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

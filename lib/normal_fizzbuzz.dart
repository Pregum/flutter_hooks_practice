import 'package:flutter/material.dart';

class NormalFizzBuzzPage extends StatefulWidget {
  const NormalFizzBuzzPage({super.key});

  @override
  State<StatefulWidget> createState() => _NormalFizzBuzzState();
}

class _NormalFizzBuzzState extends State<NormalFizzBuzzPage> {
  var count = 0;
  final resetToken = ValueNotifier<Object>(Object());

  @override
  void initState() {
    super.initState();
    resetToken.addListener(() {
      debugPrint('count reset! $resetToken');
      count = 0;
    });
    resetToken.value = Object();
  }

  @override
  void dispose() {
    resetToken.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('count: $count'),
            ElevatedButton(
              onPressed: () {
                setState(() => resetToken.value = Object());
              },
              child: const Text('reset!'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() => count += 1),
      ),
    );
  }
}

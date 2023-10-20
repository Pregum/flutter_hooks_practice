import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HooksFizzBuzzPage extends HookWidget {
  const HooksFizzBuzzPage({super.key});

  @override
  Widget build(BuildContext context) {
    final count = useState(0);
    final resetToken = useState(Object());

    useEffect(
      () {
        debugPrint('count reset! $resetToken');
        count.value = 0;
        return null;
      },
      [resetToken.value],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('hooks page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('count: $count'),
            Text('count.value: ${count.value}'),
            ElevatedButton(
              onPressed: () => resetToken.value = Object(),
              child: const Text('reset!'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => count.value += 1,
      ),
    );
  }
}

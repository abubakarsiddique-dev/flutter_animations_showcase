import 'package:flutter/material.dart';

class TweenBuilderDemo extends StatefulWidget {
  const TweenBuilderDemo({super.key});
  @override
  State<TweenBuilderDemo> createState() => _State();
}

class _State extends State<TweenBuilderDemo> {
  double _target = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TweenAnimationBuilder')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _target),
              duration: const Duration(seconds: 2),
              curve: Curves.easeOut,
              builder: (context, value, _) => Text(
                value.toInt().toString(),
                style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => setState(() => _target = _target == 0 ? 1000 : 0),
              child: const Text('Count up / reset'),
            ),
          ],
        ),
      ),
    );
  }
}

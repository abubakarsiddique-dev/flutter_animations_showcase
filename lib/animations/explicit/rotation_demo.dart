import 'package:flutter/material.dart';

class RotationDemo extends StatefulWidget {
  const RotationDemo({super.key});
  @override
  State<RotationDemo> createState() => _State();
}

class _State extends State<RotationDemo> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _c.isAnimating ? _c.stop() : _c.repeat());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotation (explicit)')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RotationTransition(
              turns: _c,
              child: const Icon(Icons.settings, size: 140, color: Colors.indigo),
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: _toggle,
              child: Text(_c.isAnimating ? 'Stop' : 'Start'),
            ),
          ],
        ),
      ),
    );
  }
}

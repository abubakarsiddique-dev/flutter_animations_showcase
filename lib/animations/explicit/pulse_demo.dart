import 'package:flutter/material.dart';

class PulseDemo extends StatefulWidget {
  const PulseDemo({super.key});
  @override
  State<PulseDemo> createState() => _State();
}

class _State extends State<PulseDemo> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
        ..repeat(reverse: true);
  late final Animation<double> _curve =
      CurvedAnimation(parent: _c, curve: Curves.easeInOut);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pulse')),
      body: Center(
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.4, end: 1).animate(_curve),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.2).animate(_curve),
            child: const Icon(Icons.favorite, size: 120, color: Colors.red),
          ),
        ),
      ),
    );
  }
}

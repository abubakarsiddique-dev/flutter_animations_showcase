import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});
  @override
  State<AnimatedContainerDemo> createState() => _State();
}

class _State extends State<AnimatedContainerDemo> {
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => _big = !_big),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutCubic,
            width: _big ? 250 : 120,
            height: _big ? 250 : 120,
            decoration: BoxDecoration(
              color: _big ? Colors.orange : Colors.blue,
              borderRadius: BorderRadius.circular(_big ? 125 : 12),
            ),
            child: const Center(child: Text('Tap me')),
          ),
        ),
      ),
    );
  }
}

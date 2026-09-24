import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimateDemo extends StatelessWidget {
  const AnimateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_animate')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Hello, Animations!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.5, end: 0),
          const SizedBox(height: 24),
          const Text('Shimmer text', style: TextStyle(fontSize: 28))
              .animate(onPlay: (c) => c.repeat())
              .shimmer(duration: 1500.ms, color: Colors.indigo),
          const SizedBox(height: 24),
          ...List.generate(
            5,
            (i) => Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text('List item ${i + 1}'),
              ),
            )
                .animate(delay: (i * 150).ms)
                .fadeIn()
                .slideX(begin: -0.3, end: 0),
          ),
          const SizedBox(height: 24),
          const Center(child: Icon(Icons.star, size: 80, color: Colors.amber))
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.3, 1.3))
              .rotate(begin: -0.05, end: 0.05),
        ],
      ),
    );
  }
}

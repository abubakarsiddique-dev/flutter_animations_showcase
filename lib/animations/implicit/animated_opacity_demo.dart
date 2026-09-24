import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({super.key});
  @override
  State<AnimatedOpacityDemo> createState() => _State();
}

class _State extends State<AnimatedOpacityDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedOpacity')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(milliseconds: 700),
              child: const FlutterLogo(size: 150),
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () => setState(() => _visible = !_visible),
              child: Text(_visible ? 'Fade out' : 'Fade in'),
            ),
          ],
        ),
      ),
    );
  }
}

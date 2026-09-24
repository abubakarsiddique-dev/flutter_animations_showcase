import 'package:flutter/material.dart';

class StaggeredDemo extends StatefulWidget {
  const StaggeredDemo({super.key});
  @override
  State<StaggeredDemo> createState() => _State();
}

class _State extends State<StaggeredDemo> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1600));
  static const _count = 5;

  @override
  void initState() {
    super.initState();
    _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _c,
                builder: (context, _) => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (var i = 0; i < _count; i++)
                      Expanded(
                        child: Builder(builder: (context) {
                          final start = i * 0.12;
                          final anim = CurvedAnimation(
                            parent: _c,
                            curve: Interval(start, start + 0.5, curve: Curves.easeOutBack),
                          ).value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: FractionallySizedBox(
                              heightFactor: ((0.2 + 0.16 * i) * anim).clamp(0.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.primaries[i * 3],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => _c.forward(from: 0),
              child: const Text('Replay'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

const _colors = [Colors.teal, Colors.deepOrange, Colors.purple, Colors.amber];

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          for (var i = 0; i < _colors.length; i++)
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => _HeroDetail(index: i)),
              ),
              child: Hero(
                tag: 'hero-$i',
                child: Container(
                  decoration: BoxDecoration(
                    color: _colors[i],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text('${i + 1}',
                        style: const TextStyle(fontSize: 40, color: Colors.white)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeroDetail extends StatelessWidget {
  final int index;
  const _HeroDetail({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item ${index + 1}')),
      body: Center(
        child: Hero(
          tag: 'hero-$index',
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: _colors[index],
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
      ),
    );
  }
}

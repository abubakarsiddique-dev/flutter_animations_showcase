import 'package:flutter/material.dart';
import 'animations/explicit/pulse_demo.dart';
import 'animations/explicit/rotation_demo.dart';
import 'animations/flutter_animate/animate_demo.dart';
import 'animations/hero/hero_demo.dart';
import 'animations/implicit/animated_container_demo.dart';
import 'animations/implicit/animated_opacity_demo.dart';
import 'animations/implicit/animated_switcher_demo.dart';
import 'animations/implicit/tween_builder_demo.dart';
import 'animations/lottie/lottie_demo.dart';
import 'animations/rive/rive_demo.dart';
import 'animations/staggered/staggered_demo.dart';

class Demo {
  final String title;
  final String subtitle;
  final Widget page;
  const Demo(this.title, this.subtitle, this.page);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const sections = <String, List<Demo>>{
      'Implicit': [
        Demo('AnimatedContainer', 'Size, color, radius', AnimatedContainerDemo()),
        Demo('AnimatedOpacity', 'Fade in/out', AnimatedOpacityDemo()),
        Demo('AnimatedSwitcher', 'Widget change transition', AnimatedSwitcherDemo()),
        Demo('TweenAnimationBuilder', 'Custom tween counter', TweenBuilderDemo()),
      ],
      'Explicit': [
        Demo('Rotation', 'AnimationController + RotationTransition', RotationDemo()),
        Demo('Pulse', 'Repeat + Scale + Fade', PulseDemo()),
      ],
      'Hero': [
        Demo('Hero', 'Shared element transition', HeroDemo()),
      ],
      'Staggered': [
        Demo('Staggered bars', 'Intervals on one controller', StaggeredDemo()),
      ],
      'flutter_animate': [
        Demo('flutter_animate', 'Chained effects', AnimateDemo()),
      ],
      'Lottie': [
        Demo('Lottie', 'JSON animation', LottieDemo()),
      ],
      'Rive': [
        Demo('Rive', 'Interactive .riv animation', RiveDemo()),
      ],
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animations Showcase')),
      body: ListView(
        children: [
          for (final entry in sections.entries) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
              child: Text(entry.key,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold)),
            ),
            for (final d in entry.value)
              ListTile(
                title: Text(d.title),
                subtitle: Text(d.subtitle),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => d.page)),
              ),
          ],
        ],
      ),
    );
  }
}

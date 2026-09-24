import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

// rive ^0.14.x API. File network se load hoti hai (internet chahiye).
// Offline ke liye: .riv file assets/rive/ ma rakhen aur
// FileLoader.fromAsset('assets/rive/vehicles.riv', riveFactory: Factory.rive) use karein.
class RiveDemo extends StatefulWidget {
  const RiveDemo({super.key});
  @override
  State<RiveDemo> createState() => _State();
}

class _State extends State<RiveDemo> {
  late final FileLoader _fileLoader = FileLoader.fromUrl(
    'https://cdn.rive.app/animations/vehicles.riv',
    riveFactory: Factory.rive,
  );

  @override
  void dispose() {
    _fileLoader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rive')),
      body: RiveWidgetBuilder(
        fileLoader: _fileLoader,
        builder: (context, state) => switch (state) {
          RiveLoading() => const Center(child: CircularProgressIndicator()),
          RiveFailed() => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Rive load nahi hui: ${state.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          RiveLoaded() => RiveWidget(
              controller: state.controller,
              fit: Fit.contain,
            ),
        },
      ),
    );
  }
}

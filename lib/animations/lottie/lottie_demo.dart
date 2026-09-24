import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Network se load hota hai (internet chahiye). Offline ke liye file
// assets/lottie/ ma rakh kar Lottie.asset('assets/lottie/file.json') use karein.
const _url =
    'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json';

class LottieDemo extends StatelessWidget {
  const LottieDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lottie')),
      body: Center(
        child: Lottie.network(
          _url,
          width: 280,
          repeat: true,
          errorBuilder: (context, error, stack) => const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
                'Lottie load nahi hui. Internet check karein ya asset file use karein.',
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}

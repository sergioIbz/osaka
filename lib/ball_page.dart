import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gyroscope_provider.dart';

class BallPage extends ConsumerWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Placeholder(
        child: gyroscope$.when(
          data: (data) => SizedBox.expand(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  top: ((size.height / 2) - 40) + (100 * data.x),
                  left: ((size.width / 2) - 40) + (100 * data.y),
                  duration: const Duration(milliseconds: 500),
                  child: const CircleAvatar(
                    radius: 40,
                  ),
                ),
              ],
            ),
          ),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

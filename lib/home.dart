import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gyroscope_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      body: Center(
        child: gyroscope$.when(
          data: (data) => SizedBox(
            width: 320,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    width: 320,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: const AssetImage('assets/osaka-sky.png'),
                        fit: BoxFit.none,
                        alignment: Alignment(data.y * 0.1, data.x * 0.1),
                      ),
                    ),
                    duration: const Duration(milliseconds: 2),
                    curve: Curves.linear,
                  ),
                  AnimatedPositioned(
                    top: 20 + (10 * data.x),
                    left: ((320 - 179.9) / 2) + (10 * data.y),
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'OSAKA',
                      style: TextStyle(
                        fontSize: 90,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    bottom: -130 + (data.x * 20),
                    right: -10 + (data.y * 20),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                    child: Image.asset(
                      'assets/osaka-tower.webp',
                      height: 500,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 320,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withOpacity(0.2),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 24,
                            spreadRadius: 16,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        child: Placeholder(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: Container(
                              alignment: Alignment.center,
                              width: 320,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              child: const Text(
                                'Osaka Castle\nOsaka, Japan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   '$data',
                  //   style: const TextStyle(
                  //     color: Colors.amber,
                  //     fontSize: 30,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

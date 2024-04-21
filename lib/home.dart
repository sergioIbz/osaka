import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gyroscope_provider.dart';

import 'package:vector_math/vector_math_64.dart' as vector;

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
            // color: Colors.red,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    top: -10 + (10 * data.x.clamp(-1, 1)),
                    right: -10 + (10 * data.y.clamp(-1, 1)),
                    child: SizedBox(
                      width: 340,
                      height: 270,
                      child: Image.asset(
                        'assets/osaka-sky.png',
                        fit: BoxFit.cover,
                      ),
                    ),
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
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 10,
                            offset: Offset(5 + data.x, 5 + data.y),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    bottom: -130 + (data.x.clamp(-1, 1) * 10),
                    right: -10 + (data.y.clamp(-1, 1) * 10),
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
                        color: Colors.white.withOpacity(0.01),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 24,
                            spreadRadius: 16,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            alignment: Alignment.center,
                            width: 320,
                            height: 60,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(16),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: const Text(
                              'Osaka Castle\nOsaka, Japan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
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

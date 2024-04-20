import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 320,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              children: [
                Container(
                  width: 320,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.amber,
                    image: const DecorationImage(
                      image: AssetImage('assets/osaka-sky.png'),
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
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
                Positioned(
                  bottom: -130,
                  right: -10,
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
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

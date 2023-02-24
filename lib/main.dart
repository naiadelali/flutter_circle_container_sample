import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: CircularContainers(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class CircularContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double containerSize = min(size.width, size.height) / 7;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            left: centerX - containerSize / 2,
            top: centerY - containerSize / 2,
            child: Container(
              height: containerSize,
              width: containerSize,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
          ...List.generate(10, (index) {
            final angle = 2 * pi * index / 10;
            final x = centerX + cos(angle) * 2.5 * containerSize;
            final y = centerY + sin(angle) * 2.5 * containerSize;
            return Positioned(
              left: x - containerSize / 2,
              top: y - containerSize / 2,
              child: Container(
                height: containerSize,
                width: containerSize,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

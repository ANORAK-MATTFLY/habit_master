import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerLoader extends StatefulWidget {
  const ShimmerLoader({Key? key}) : super(key: key);

  @override
  State<ShimmerLoader> createState() => _ShimmerLoaderState();
}

class _ShimmerLoaderState extends State<ShimmerLoader> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 90.0,
      width: (width - 40),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 33, 33, 33),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          color: const Color.fromARGB(53, 85, 85, 85),
          duration: 3000.ms,
        );
  }
}

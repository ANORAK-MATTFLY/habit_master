import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class BackgroundAnimation extends StatefulWidget {
  const BackgroundAnimation({Key? key}) : super(key: key);

  @override
  State<BackgroundAnimation> createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation>
    with SingleTickerProviderStateMixin {
  late GifController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      image: const AssetImage("assets/animations/bg_animation.gif"),
      controller:
          _animationController, // if duration and fps is null, original gif fps will be used.
      // fps: 30,
      repeat: ImageRepeat.repeat,
      // duration: const Duration(seconds: 3),
      autostart: Autostart.loop,
      placeholder: (context) => const Text('Loading...'),
      onFetchCompleted: () {
        _animationController.reset();
        _animationController.forward();
      },
    );
  }
}

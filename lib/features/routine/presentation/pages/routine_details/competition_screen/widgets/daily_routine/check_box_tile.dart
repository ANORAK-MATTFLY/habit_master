import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/widgets/daily_routine/progress_graph.dart';

class CheckBoxItem extends StatefulWidget {
  final Color color;
  final Color shimmer;
  const CheckBoxItem({Key? key, required this.color, required this.shimmer})
      : super(key: key);

  @override
  State<CheckBoxItem> createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  bool _triggerState = false;
  double _width = 0.0;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: widget.color,
      checkColor: const Color.fromARGB(255, 28, 4, 53),
      side: const BorderSide(width: 1, color: Color.fromARGB(255, 89, 89, 89)),
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      secondary: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text(
                "Your monthly progression on this task over the month",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Twitterchirp",
                  fontSize: 14.0,
                  decoration: TextDecoration.none,
                ),
              ),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              content: ProgressGraph(),
            ).animate().fadeIn(),
          );
        },
        icon: Icon(
          Icons.more,
          color: widget.color,
          size: 20.0,
        ),
      ),
      value: _triggerState,
      onChanged: (bool? value) {
        setState(() {
          if (value == true) {
            _width = 200.0;
          }
          if (value == false) {
            _width = 0.0;
          }
          _triggerState = !_triggerState;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: throwLine(_width, widget.color, widget.shimmer),
    );
  }
}

Widget throwLine(double width, Color color, shimmer) {
  return width == 0.0
      ? Stack(
          children: [
            const Text(
              "Do not receive notifications",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Twitterchirp",
                fontSize: 17.0,
                decoration: TextDecoration.none,
              ),
            ),
            Positioned(
              bottom: 7.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: color,
                height: 1.5,
                width: 0.0,
              ),
            )
          ],
        )
      : Stack(
          children: [
            const Text(
              "Do not receive notifications",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Twitterchirp",
                fontSize: 17.0,
                decoration: TextDecoration.none,
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(color: shimmer, duration: 1800.ms),
            Positioned(
              bottom: 7.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: color,
                height: 1.5,
                width: 240.0,
              ),
            )
          ],
        );
}

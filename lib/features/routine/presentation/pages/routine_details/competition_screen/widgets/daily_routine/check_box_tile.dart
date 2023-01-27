import 'package:flutter/material.dart';

class CheckBoxItem extends StatefulWidget {
  final Color color;
  const CheckBoxItem({Key? key, required this.color}) : super(key: key);

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
      secondary: Container(
        height: 20,
        width: 30.0,
        color: Colors.black,
        child: const Center(
          child: Text(
            "7:30",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Twitterchirp_bold",
              fontSize: 10.0,
              decoration: TextDecoration.none,
            ),
          ),
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
      title: throwLine(_width, widget.color),
    );
  }
}

Widget throwLine(double width, color) {
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
            ),
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

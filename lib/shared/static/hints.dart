import 'dart:math';

showHint(String dynamicString) {
  final random = Random();
  final hint = "To delete an habit swipe left or right";

  final dynamicHint =
      "Hi! 👋 I'm $dynamicString and welcome to my daily routine!";

  final hints = [hint, dynamicHint];

  return hints[random.nextInt(hints.length)];
}

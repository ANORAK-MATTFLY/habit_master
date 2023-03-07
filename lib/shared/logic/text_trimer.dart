String textTrimer(String text, int limit) {
  final String trimmedText =
      text.length > limit ? text.substring(0, limit) : text;
  return trimmedText;
}

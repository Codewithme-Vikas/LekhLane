int calculateReadingTime(String content) {
  // RegExp(r'\s+') -> length and space
  final int wordCount = content.split(RegExp(r's+')).length;

  // To Do: implement slow, defualt, fast speed feature
  final int speed = 1; // default

  final double time = wordCount / speed;

  return time.ceil();
}

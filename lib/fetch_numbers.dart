Future<List<int>> fetchNumbers({int count = 3}) async {
  if (count <= 0) {
    throw ArgumentError('Count must be greater than zero');
  }

  await Future.delayed(Duration(milliseconds: 500));
  return List.generate(count, (i) => i + 1);
}

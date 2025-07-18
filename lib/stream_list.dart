Stream<int> countStream({int max = 5}) async* {
  if (max <= 0) {
    throw ArgumentError('Max must be greater than zero');
  }

  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i;
  }
}

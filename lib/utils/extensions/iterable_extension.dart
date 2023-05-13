extension IterableExtension<T> on Iterable<T> {
  /// The first element satisfying [condition], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) condition) {
    for (var element in this) {
      if (condition(element)) return element;
    }
    return null;
  }
}

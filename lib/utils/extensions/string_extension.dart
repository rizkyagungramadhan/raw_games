extension NullableStringExtension on String? {
  static const _nil = 'null';

  bool get isNullOrEmpty {
    return this == null || this == '' || this == _nil;
  }

  bool get isNotNullOrEmpty {
    return this != null && this != '' && this != _nil;
  }

  String get orEmpty {
    return (this != _nil ? this : null) ?? '';
  }
}
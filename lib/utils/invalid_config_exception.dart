class InvalidConfigException implements Exception {
  const InvalidConfigException(this.message);

  final String message;

  @override
  String toString() => '''[GITHUB APP PANICKED]
Cause: $message
Usage:
    flutter run --dart-define-from-file=<path-to-config-file>
''';
}

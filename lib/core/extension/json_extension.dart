extension JsonX on Map<String, dynamic> {
  String parseString(String key, {String defaultValue = ''}) {
    final value = this[key];
    if (value == null) return defaultValue;
    if (value is String) return value;
    return value.toString();
  }

  int parseInt(String key, {int defaultValue = 0}) {
    final value = this[key];
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  bool parseBool(String key, {bool defaultValue = false}) {
    final value = this[key];
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) return value.toLowerCase() == 'true';
    return defaultValue;
  }

  double parseDouble(String key, {double defaultValue = 0.0}) {
    final value = this[key];
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  List<Object?> parseList(
    String index, {
    List<Object?> defaultValue = const [],
  }) {
    final data = this[index];
    if (data == null) return defaultValue;
    if (data is List<Object?>) return data;
    if (data is List) return data.map((e) => e as Object?).toList();
    return defaultValue;
  }
}

/// A standard Dart class without Freezed or any code generation.
/// This is useful when you want to avoid build_runner and keep things simple.
class SimpleItem {
  final String id;
  final String title;
  final bool isDone;

  const SimpleItem({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  /// The copyWith method is essential for IMMUTABLE state changes.
  SimpleItem copyWith({
    String? id,
    String? title,
    bool? isDone,
  }) {
    return SimpleItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  /// Factory for JSON conversion
  factory SimpleItem.fromJson(Map<String, dynamic> json) {
    return SimpleItem(
      id: json['id'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimpleItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          isDone == other.isDone;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ isDone.hashCode;
}

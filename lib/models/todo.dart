class Todo {
  final String id;
  final String title;
  final String description;
  final String category;
  final bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
  });

  // copyWith untuk update sebagian data (contoh: toggle isDone)
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      isDone: isDone ?? this.isDone,
    );
  }
}

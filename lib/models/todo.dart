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

  // 🔽 Convert ke Map untuk SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'isDone': isDone ? 1 : 0,
    };
  }

  // 🔽 Convert dari Map ke Object
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      isDone: map['isDone'] == 1,
    );
  }
}

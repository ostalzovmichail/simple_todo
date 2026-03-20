class TodoModel {
  final int id;
  final String todo;
  final bool isCompleted;

  const TodoModel({
    required this.id,
    required this.todo,
    this.isCompleted = false,
  });

  TodoModel copyWith({int? id, String? todo, bool? isCompleted}) {
    return TodoModel(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

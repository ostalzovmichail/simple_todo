part of 'todo_bloc.dart';

sealed class TodoEvent {}

class CreateTodo extends TodoEvent {
  final String todo;

  CreateTodo(this.todo);
}

class ToggleTodo extends TodoEvent {
  final int id;
  final bool isCompleted;

  ToggleTodo(this.id, this.isCompleted);
}

class DeleteTodo extends TodoEvent {
  final int id;
  DeleteTodo(this.id);
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/todo_data.dart';
import '../models/todo_model.dart';
import '../repository/todo_repo.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial(todoData)) {
    on<CreateTodo>(_createTodo);
    on<ToggleTodo>(_toggleTodo);
    on<DeleteTodo>(_deleteTodo);
  }

  void _createTodo(CreateTodo event, Emitter<TodoState> emit) {
    final newTodo = TodoModel(id: todoData.length, todo: event.todo);
    TodoRepo().createTodo(newTodo);
    emit(TodoState(todoData));
  }

  void _toggleTodo(ToggleTodo event, Emitter<TodoState> emit) {
    TodoRepo().toggleTodo(event.id, event.isCompleted);
    emit(TodoState(todoData));
  }

  void _deleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    final todo = todoData[event.id];
    TodoRepo().deleteTodo(todo);
    emit(TodoState(todoData));
  }
}

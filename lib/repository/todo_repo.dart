import '../data/todo_data.dart';
import '../models/todo_model.dart';

class TodoRepo {
  void createTodo(TodoModel todo) {
    final newTodo = TodoModel(id: todoData.length, todo: todo.todo);

    todoData.add(newTodo);
  }

  void toggleTodo(int index, bool changeTogle) {
    final List<TodoModel> newTodo = todoData;
    final currentTodo = newTodo[index];
    newTodo[index] = currentTodo.copyWith(isCompleted: changeTogle);
  }

  void deleteTodo(TodoModel todo) {
    todoData.removeAt(todo.id);
  }
}

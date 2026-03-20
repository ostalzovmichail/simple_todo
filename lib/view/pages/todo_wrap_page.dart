import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/view/widgets/add_button_widget.dart';
import 'package:todo/view/widgets/add_text_widget.dart';

class TodoActions {
  void addTodo(BuildContext context, TextEditingController controller) {
    context.read<TodoBloc>().add(CreateTodo(controller.text));
    controller.clear();
  }

  void toggleTodo(BuildContext context, int id, bool isCompleted) {
    context.read<TodoBloc>().add(ToggleTodo(id, isCompleted));
  }

  void deleteTodo(BuildContext context, int id) {
    context.read<TodoBloc>().add(DeleteTodo(id));
  }
}

class TodoWrapPage extends StatelessWidget {
  TodoWrapPage({super.key});

  final TodoActions actions = TodoActions();

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Список задач'), centerTitle: true),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Column(
          children: [
            AddTextWidget(controller: controller),
            SizedBox(height: heightScreen / 100 * 1),
            AddButtonWidget(
              addTodo: () {
                actions.addTodo(context, controller);
              },
            ),
            SizedBox(height: heightScreen / 100 * 1),
            SizedBox(
              height: heightScreen / 100 * 60,
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  return ListView(
                    children: state.todos.asMap().entries.map((e) {
                      return ListTile(
                        leading: Checkbox(
                          value: e.value.isCompleted,
                          onChanged: (bool? newValue) {
                            if (newValue != null) {
                              actions.toggleTodo(
                                context,
                                e.key,
                                !e.value.isCompleted,
                              );
                            }
                          },
                        ),
                        title: Text(e.value.todo),
                        trailing: IconButton(
                          onPressed: () {
                            actions.deleteTodo(context, e.key);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

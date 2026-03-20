import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key, required this.addTodo});

  final Function addTodo;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){addTodo();}, child: Text('Добавить'));
  }
}

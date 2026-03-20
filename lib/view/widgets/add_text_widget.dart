import 'package:flutter/material.dart';

class AddTextWidget extends StatelessWidget {
  const AddTextWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hint: Text('Новая задача'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

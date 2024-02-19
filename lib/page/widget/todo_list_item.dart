import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/todo_item.dart';
import 'package:flutter/material.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: todo_list_item
/// Created by sujangmac
///
/// Description:
///
class TodoListItem extends StatelessWidget {
  final TodoItem item;
  final void Function(String, bool) onEdit;
  final void Function(String) onRemove;

  const TodoListItem(
      {super.key,
      required this.item,
      required this.onEdit,
      required this.onRemove});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          item.text,
          style: TextStyle(
              decoration: item.done ? TextDecoration.lineThrough : null),
        ),
        leading: Checkbox(
          value: item.done,
          onChanged: (value) => onEdit(item.id, value ?? false),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => onRemove(item.id),
        ),
      );
}

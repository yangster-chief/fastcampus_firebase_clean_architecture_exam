import 'package:fastcampus_firebase_clean_architecture_exam/page/todo/provider/todo_list_provider.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/page/widget/todo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: todo_list_item_page
/// Created by sujangmac
///
/// Description:
///

class TodoItemsPage extends ConsumerStatefulWidget {
  const TodoItemsPage({super.key});

  @override
  ConsumerState createState() => _TodoItemsPageState();
}

class _TodoItemsPageState extends ConsumerState<TodoItemsPage> {
  @override
  Widget build(BuildContext context) {
    final todoItemState = ref.watch(todoListNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Items'),
        actions: [
          IconButton(
              onPressed: () =>
                  ref.read(todoListNotifierProvider.notifier).loadTodoItem(),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: todoItemState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : todoItemState.errorMessage != null
              ? Center(child: Text(todoItemState.errorMessage!))
              : todoItemState.isEmpty
                  ? const Center(child: Text('No Todo Items Found'))
                  : ListView.builder(
                      itemCount: todoItemState.items.length,
                      itemBuilder: (context, index) => TodoListItem(
                        item: todoItemState.items[index],
                        onEdit: (id, done) => ref
                            .read(todoListNotifierProvider.notifier)
                            .updateTodoItem(id, done),
                        onRemove: (id) => ref
                            .read(todoListNotifierProvider.notifier)
                            .deleteTodoItem(id),
                      ),
                    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final text = await _showAddToDoDialog(context);
          if (text != null && text.isNotEmpty) {
            ref.read(todoListNotifierProvider.notifier).addTodoItem(text);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<String?> _showAddToDoDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New ToDo'),
        content: TextField(
            controller: controller,
            decoration:
                const InputDecoration(hintText: 'Enter ToDo text here')),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('Add')),
        ],
      ),
    );
  }
}

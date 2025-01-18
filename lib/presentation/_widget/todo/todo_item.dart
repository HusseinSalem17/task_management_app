import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/constants/path_constants.dart';
import 'package:task_manager_app/domain/entities/todo/todo_detail_entity.dart';

Widget todoItem({
  required BuildContext context,
  required TodoDetailEntity todo,
  required VoidCallback onDelete,
}) {
  return InkWell(
    onTap: () {
      context.push(
        PathConstants.viewAndEditTodoView,
        extra: todo,
      );
    },
    child: Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    todo.todo ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    softWrap: true,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text('User: ${todo.userId}'),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Text('Completed: '),
                Icon(
                  todo.completed! ? Icons.check_circle : Icons.cancel,
                  color: todo.completed! ? Colors.green : Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

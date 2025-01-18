import '../../../models/export_models.dart';

abstract class TodoRemoteDataSource {
  const TodoRemoteDataSource();

  // Returns a list of todos
  Future<TodoModel> getTodos();

  // Returns Random Todos
  Future<TodoModel> getRandomTodos();

  // Returns todos by pagination
  Future<TodoModel> getTodosByPagination({
    //? The limit is the number of todos to return
    required int limit,
    //? The skip is the number of todos to skip
    required int skip,
  });

  // Returns todos of a specific user
  Future<TodoModel> getUserTodos({
    required String userId,
  });

  // Returns the data of the current todo
  Future<TodoModel> getTodoDetail({
    required int todoId,
  });

  // Create a new todo
  Future<TodoDetailModel> createTodo({
    required TodoDetailModel todo,
  });

  // Update a todo
  Future<TodoDetailModel> updateTodo({
    //? The id of the todo to update
    required int todoId,
    required TodoDetailModel todo,
  });

  // Delete a todo
  Future<TodoDetailModel> deleteTodo({
    //? The id of the todo to delete
    required int todoId,
  });
}

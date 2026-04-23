import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<ApiResult<List<TodoEntity>>> getTodos(
    int userId, {
    TodoStatus? status,
  });

  Future<ApiResult<bool>> createTodo(TodoEntity todo);

  Future<ApiResult<bool>> updateTodo(TodoEntity todo);

  Future<ApiResult<bool>> deleteTodo(TodoEntity todo);
}

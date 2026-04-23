import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/common/repository/repository_helper.dart';
import 'package:clean_architecture_bloc/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/todo/data/models/todo.dart';
import 'package:clean_architecture_bloc/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_bloc/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository with RepositoryHelper<ToDo> {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<TodoEntity>>> getTodos(
    int userId, {
    TodoStatus? status,
  }) async {
    return checkItemsFailOrSuccess(
        remoteDataSource.getTodos(userId, status: status));
  }

  @override
  Future<ApiResult<bool>> createTodo(TodoEntity todo) async {
    return checkItemFailOrSuccess(
      remoteDataSource.createTodo(ToDo.fromEntity(todo)),
    );
  }

  @override
  Future<ApiResult<bool>> updateTodo(TodoEntity todo) async {
    return checkItemFailOrSuccess(
      remoteDataSource.updateTodo(ToDo.fromEntity(todo)),
    );
  }

  @override
  Future<ApiResult<bool>> deleteTodo(TodoEntity todo) async {
    return checkItemFailOrSuccess(
      remoteDataSource.deleteTodo(ToDo.fromEntity(todo)),
    );
  }
}

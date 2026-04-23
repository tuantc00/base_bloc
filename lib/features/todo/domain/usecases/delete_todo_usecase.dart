import 'package:flutter/foundation.dart' show immutable;
import 'package:clean_architecture_bloc/common/usecase/usecase.dart';
import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_bloc/features/todo/domain/repositories/todo_repository.dart';

@immutable
class DeleteTodoUseCase implements UseCase<bool, DeleteTodoParams> {
  final TodoRepository todoRepository;

  const DeleteTodoUseCase(this.todoRepository);

  @override
  Future<ApiResult<bool>> call(DeleteTodoParams params) async {
    return await todoRepository.deleteTodo(params.todo);
  }
}

@immutable
class DeleteTodoParams {
  final TodoEntity todo;

  const DeleteTodoParams(this.todo);
}

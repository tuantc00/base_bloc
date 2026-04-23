import 'package:flutter/foundation.dart' show immutable;
import 'package:clean_architecture_bloc/common/usecase/usecase.dart';
import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';
import 'package:clean_architecture_bloc/features/user/domain/repositories/user_repository.dart';

@immutable
class UpdateUserUseCase implements UseCase<bool, UpdateUserParams> {
  final UserRepository userRepository;

  const UpdateUserUseCase(this.userRepository);

  @override
  Future<ApiResult<bool>> call(UpdateUserParams params) async {
    return await userRepository.updateUser(params.user);
  }
}

@immutable
class UpdateUserParams {
  final UserEntity user;

  const UpdateUserParams(this.user);
}

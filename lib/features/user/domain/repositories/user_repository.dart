import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<ApiResult<List<UserEntity>>> getUsers({
    Gender? gender,
    UserStatus? status,
  });

  Future<ApiResult<bool>> createUser(UserEntity user);

  Future<ApiResult<bool>> updateUser(UserEntity user);

  Future<ApiResult<bool>> deleteUser(UserEntity user);
}

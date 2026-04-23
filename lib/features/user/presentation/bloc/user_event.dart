import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';

/// Events should be named in the past tense because events are things
/// that have already occurred from the bloc's perspective.

abstract class UserEvent {}

class UsersFetched extends UserEvent {
  final Gender? gender;
  final UserStatus? status;

  UsersFetched({this.gender, this.status});
}

class UserCreated extends UserEvent {
  final UserEntity user;

  UserCreated(this.user);
}

class UserUpdated extends UserEvent {
  final UserEntity user;

  UserUpdated(this.user);
}

class UserDeleted extends UserEvent {
  final UserEntity user;

  UserDeleted(this.user);
}

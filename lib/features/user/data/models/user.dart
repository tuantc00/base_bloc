import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User extends UserEntity {
  const User({
    super.id,
    required super.name,
    required super.email,
    required super.gender,
    @JsonKey(name: "status") required super.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromEntity(UserEntity entity) {
    return User(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      gender: entity.gender,
      status: entity.status,
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

import 'package:dartz/dartz.dart';
import 'package:mall/core/error/failures.dart';
import 'package:mall/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> getData();

  Future<Either<Failure, AuthEntity>> setData(AuthState state);
}

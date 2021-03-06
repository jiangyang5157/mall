import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mall/core/error/failures.dart';
import 'package:mall/core/usecase/usecase.dart';
import 'package:mall/features/backend/domain/entities/user_entity.dart';
import 'package:mall/features/backend/domain/repositories/user_repository.dart';

class Save implements UseCase<UserEntity, SaveParams> {
  final UserRepository repository;

  Save(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SaveParams params) async {
    return await repository.save(entity: params.entity);
  }
}

class SaveParams extends Equatable {
  final UserEntity entity;

  SaveParams({this.entity}) : super([entity]);
}

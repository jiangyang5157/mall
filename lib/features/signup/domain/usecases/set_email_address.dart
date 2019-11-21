import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mall/core/error/failures.dart';
import 'package:mall/core/usecase/usecase.dart';
import 'package:mall/features/signup/domain/entities/sign_up_entity.dart';
import 'package:mall/features/signup/domain/repositories/sign_up_repository.dart';

class SetEmailAddress implements UseCase<SignUpEntity, SetEmailAddressParams> {
  final SignUpRepository repository;

  SetEmailAddress(this.repository);

  @override
  Future<Either<Failure, SignUpEntity>> call(
      SetEmailAddressParams params) async {
    return await repository.setEmailAddress(
      params.entity,
      params.emailAddress,
    );
  }
}

class SetEmailAddressParams extends Equatable {
  final SignUpEntity entity;
  final String emailAddress;

  SetEmailAddressParams({
    @required this.entity,
    @required this.emailAddress,
  }) : super([entity, emailAddress]);
}

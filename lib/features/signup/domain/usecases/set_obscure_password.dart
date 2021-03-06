import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mall/core/error/failures.dart';
import 'package:mall/core/usecase/usecase.dart';
import 'package:mall/features/signup/domain/entities/sign_up_entity.dart';
import 'package:mall/features/signup/domain/repositories/sign_up_repository.dart';

class SetObscurePassword
    implements UseCase<SignUpEntity, SetObscurePasswordParams> {
  final SignUpRepository repository;

  SetObscurePassword(this.repository);

  @override
  Future<Either<Failure, SignUpEntity>> call(
      SetObscurePasswordParams params) async {
    return await repository.setObscurePassword(params.obscurePassword);
  }
}

class SetObscurePasswordParams extends Equatable {
  final bool obscurePassword;

  SetObscurePasswordParams(this.obscurePassword)
      : super([obscurePassword]);
}

import 'package:mall/features/signup/domain/entities/sign_up_entity.dart';

abstract class SignUpLocalDataSource {
  Future<SignUpEntity> getLastData();

  Future<bool> cacheData(SignUpEntity entity);
}

class SignUpLocalDataSourceImpl implements SignUpLocalDataSource {
  SignUpEntity _entity;

  @override
  Future<bool> cacheData(SignUpEntity entity) async {
    _entity = entity;
    return true;
  }

  @override
  Future<SignUpEntity> getLastData() {
    throw _entity;
  }
}
import 'package:injectable/injectable.dart';
import 'package:twasol/features/home/domain/repositories/home_repository.dart';

import '../../data/models/User.dart';

@injectable
class UserUseCase{
  HomeRepo repo;
  @factoryMethod
  UserUseCase(this.repo);

  Future<User?> call(int userid)=>repo.FetchUser(userid);
}
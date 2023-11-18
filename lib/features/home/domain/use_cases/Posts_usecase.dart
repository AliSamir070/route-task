import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twasol/features/home/domain/repositories/home_repository.dart';

import '../../data/models/PostModel.dart';

@injectable
class PostsUseCase{
  HomeRepo repo;
  @factoryMethod
  PostsUseCase(this.repo);

  Future<Either<List<PostModel>,String>> call()=>repo.FetchPosts();
}
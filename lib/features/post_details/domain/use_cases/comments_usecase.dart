import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twasol/features/post_details/domain/repositories/post_details_repo.dart';

import '../../data/models/CommentModel.dart';

@injectable
class CommentsUseCase{
  PostDetailsRepo repo;
  @factoryMethod
  CommentsUseCase(this.repo);

  Future<Either<List<CommentModel>,String>> call(int postid)=>repo.FetchComments(postid);
}
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twasol/features/post_details/data/data_sources/post_details_dao.dart';
import 'package:twasol/features/post_details/data/models/CommentModel.dart';
import 'package:twasol/features/post_details/domain/repositories/post_details_repo.dart';
@Injectable(as: PostDetailsRepo)
class PostDetailsRepoImpl implements PostDetailsRepo{
  PostDetailsDao apiImpl;
  @factoryMethod
  PostDetailsRepoImpl(@Named("api")this.apiImpl);
  @override
  Future<Either<List<CommentModel>, String>> FetchComments(int postid) {
    return apiImpl.FetchComments(postid);
  }

}
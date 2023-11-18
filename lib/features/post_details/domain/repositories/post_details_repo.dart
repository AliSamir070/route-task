import 'package:dartz/dartz.dart';
import 'package:twasol/features/post_details/data/models/CommentModel.dart';

abstract class PostDetailsRepo{

  Future<Either<List<CommentModel>,String>> FetchComments(int postid);
}
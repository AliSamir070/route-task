import 'package:dartz/dartz.dart';

import '../models/CommentModel.dart';

abstract class PostDetailsDao{
  Future<Either<List<CommentModel>,String>> FetchComments(int postid);
}
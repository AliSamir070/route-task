import 'package:dartz/dartz.dart';
import 'package:twasol/features/home/data/models/PostModel.dart';

import '../../data/models/User.dart';

abstract class HomeRepo{
  Future<Either<List<PostModel>,String>> FetchPosts();
  Future<User?> FetchUser(int userid);
}
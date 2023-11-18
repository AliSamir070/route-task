import 'package:dartz/dartz.dart';

import '../models/PostModel.dart';
import '../models/User.dart';

abstract class HomeDao{
  Future<Either<List<PostModel>,String>> FetchPosts();
  Future<User?> FetchUser(int userid);
}
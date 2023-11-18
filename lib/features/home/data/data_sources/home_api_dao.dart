import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:twasol/core/api/api_manager.dart';
import 'package:twasol/core/api/endpoints.dart';
import 'package:twasol/core/error_handling/error_handler.dart';
import 'package:twasol/core/error_handling/error_responsecode.dart';
import 'package:twasol/features/home/data/data_sources/home_dao.dart';
import 'package:twasol/features/home/data/models/PostModel.dart';
import 'package:twasol/features/home/data/models/User.dart';

@Named("api")
@Singleton(as: HomeDao)
class HomeApiDao implements HomeDao{
  @override
  Future<Either<List<PostModel>, String>> FetchPosts() async{
    try{
      Response? response = await ApiManager.GetRequest(endpoint: Endpoints.postsEndpoint);
      if(response?.statusCode == 200){
        List<PostModel> posts = [];
        response?.data.forEach((e){
          posts.add(PostModel.fromJson(e));
        });
        return Left(posts);
      }else{
        return Right(ErrorResponseCode.CheckError(response?.statusCode));
      }
    }catch(e){
      return Right(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<User?> FetchUser(int userid) async{
    try{
      Response? response = await ApiManager.GetRequest(endpoint: Endpoints.postUserEndpoint(userid));
      if(response?.statusCode == 200){

        return User.fromJson(response?.data);
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }

}
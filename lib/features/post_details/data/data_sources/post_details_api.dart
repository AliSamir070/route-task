import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:twasol/core/utils/constants.dart';
import 'package:twasol/features/post_details/data/data_sources/post_details_dao.dart';
import 'package:twasol/features/post_details/data/models/CommentModel.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/error_handling/error_handler.dart';
import '../../../../core/error_handling/error_responsecode.dart';

@Named("api")
@Singleton(as: PostDetailsDao)
class PostDetailsApiDaoImpl implements PostDetailsDao{
  @override
  Future<Either<List<CommentModel>, String>> FetchComments(int postid) async{
    try{
      Response? response = await ApiManager.GetRequest(endpoint: Endpoints.postCommentsEndpoint(postid),headers: {
        "Authorization":Constants.token
      });
      if(response?.statusCode == 200){
        List<CommentModel> comments = [];
        response?.data.forEach((e){
          comments.add(CommentModel.fromJson(e));
        });
        return Left(comments);
      }else{
        return Right(ErrorResponseCode.CheckError(response?.statusCode));
      }
    }catch(e){
      return Right(ErrorHandler.handle(e).failure);
    }
  }

}
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twasol/core/network/internet_checker.dart';
import 'package:twasol/features/home/data/data_sources/home_dao.dart';
import 'package:twasol/features/home/data/models/PostModel.dart';
import 'package:twasol/features/home/data/models/User.dart';
import 'package:twasol/features/home/domain/repositories/home_repository.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{
  HomeDao homeApiDao;

  @factoryMethod
  HomeRepoImpl(@Named("api")this.homeApiDao);
  @override
  Future<Either<List<PostModel>, String>> FetchPosts() {
    return homeApiDao.FetchPosts();
  }

  @override
  Future<User?> FetchUser(int userid) async{
    await InternetChecker.checkConnectivity();
    if(InternetChecker.connectionStatus != ConnectivityResult.none){
      return homeApiDao.FetchUser(userid);
    }else{
      return null;
    }
  }

}
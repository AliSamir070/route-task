import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:twasol/features/home/domain/use_cases/Posts_usecase.dart';
import 'package:twasol/features/home/domain/use_cases/user_usecase.dart';

import '../../data/models/PostModel.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  @factoryMethod
  HomeCubit(this.postsUseCase , this.userUseCase) : super(HomeInitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);
  PostsUseCase postsUseCase;
  UserUseCase userUseCase;

  List<PostModel> posts = [];

  void GetPosts(){
    print("Get posts");
    emit(HomePostsLoadingState());
    postsUseCase.call().then((value){
      value.fold((l){
        posts = l;
        Future.wait(posts.map((e) => userUseCase.call(e.userId??0).then((value){
          e.user = value;
        }))).then((value){
            print(posts);
            emit(HomePostsSuccessState());
        });
      }, (r){
        emit(HomePostsErrorState(r));
      });
    });
  }
}

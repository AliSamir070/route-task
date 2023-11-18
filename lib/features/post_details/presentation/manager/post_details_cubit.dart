import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:twasol/features/post_details/domain/use_cases/comments_usecase.dart';

import '../../data/models/CommentModel.dart';

part 'post_details_state.dart';

@injectable
class PostDetailsCubit extends Cubit<PostDetailsStates> {
  @factoryMethod
  PostDetailsCubit(this.commentsUseCase) : super(PostDetailsInitialState());
  PostDetailsCubit get(context)=>BlocProvider.of(context);
  CommentsUseCase commentsUseCase;

  List<CommentModel> comments = [];

  void getComments(int postid){
    emit(PostDetailsCommentsLoadingState());
    commentsUseCase.call(postid).then((value){
      value.fold((l){
        comments = l;
        print(comments);
        emit(PostDetailsCommentsSuccessState());
      }, (r){
        emit(PostDetailsCommentsErrorState(r));
      });
    });
  }
}

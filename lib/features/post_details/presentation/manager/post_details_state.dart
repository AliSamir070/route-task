part of 'post_details_cubit.dart';

abstract class PostDetailsStates {}

class PostDetailsInitialState extends PostDetailsStates {}
class PostDetailsCommentsLoadingState extends PostDetailsStates {}
class PostDetailsCommentsSuccessState extends PostDetailsStates {}
class PostDetailsCommentsEmptyState extends PostDetailsStates {}
class PostDetailsCommentsErrorState extends PostDetailsStates {
  String message;
  PostDetailsCommentsErrorState(this.message);
}

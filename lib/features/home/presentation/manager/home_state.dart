part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {
  HomeInitialState(){
    print("Homeinitial");
  }
}
class HomePostsLoadingState extends HomeStates {}
class HomePostsSuccessState extends HomeStates {}
class HomePostsErrorState extends HomeStates {
  String error;
  HomePostsErrorState(this.error);
}

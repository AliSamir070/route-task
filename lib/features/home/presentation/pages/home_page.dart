import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twasol/core/DI/dependency_injection.dart';
import 'package:twasol/core/reusable_components/post_item.dart';
import 'package:twasol/core/utils/helpers.dart';
import 'package:twasol/core/utils/routes_manager.dart';
import 'package:twasol/features/home/presentation/manager/home_cubit.dart';

import '../../../../core/utils/strings_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt.get<HomeCubit>()
        ..GetPosts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.home),
        ),
        body: BlocConsumer<HomeCubit , HomeStates>(
          listener: (context , state){
            if(state is HomePostsErrorState){
              showToast(state.error);
            }
          },
          builder: (BuildContext context, HomeStates state) {
            HomeCubit cubit = HomeCubit.get(context);
            return state is HomePostsLoadingState
            ?Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),)
            :state is HomePostsErrorState
            ?Center(child: InkWell(
              onTap: (){
                cubit.GetPosts();
              },
              child: Text(
                StringsManager.someWrong,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),)
            :Padding(
              padding: REdgeInsets.all(24),
              child: RefreshIndicator(
                backgroundColor: Theme.of(context).cardColor,
                onRefresh: () async{
                  await Future.delayed(Duration(seconds: 1));
                  cubit.GetPosts();

                },
                child: ListView.separated(
                    itemBuilder: (context , index)=>PostItem(post: cubit.posts[index]),
                    separatorBuilder: (context , index)=>Divider(
                      color: Theme.of(context).primaryColor,
                    ),
                    itemCount: cubit.posts.length
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}

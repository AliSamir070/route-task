import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twasol/core/DI/dependency_injection.dart';
import 'package:twasol/core/utils/strings_manager.dart';
import 'package:twasol/features/home/data/models/PostModel.dart';
import 'package:twasol/features/post_details/presentation/manager/post_details_cubit.dart';
import 'package:twasol/features/post_details/presentation/widgets/comment_item.dart';

import '../../../../core/reusable_components/post_item.dart';

class PostDetailsPage extends StatelessWidget {
  final PostModel? post;

  const PostDetailsPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt.get<PostDetailsCubit>()
        ..getComments(post?.id??0),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              StringsManager.postDetails
          ),
        ),
        body: BlocConsumer<PostDetailsCubit, PostDetailsStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            PostDetailsCubit cubit = PostDetailsCubit.get(context);
            return state is PostDetailsCommentsLoadingState
                ?Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),)
                :state is PostDetailsCommentsErrorState
                ?Center(child: InkWell(
              onTap: (){
                cubit.getComments(post?.id??0);
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
                  cubit.getComments(post?.id??0);

                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostItem(post: post!,isDetails: true,),
                      Divider(color: Theme.of(context).primaryColor,),
                      SizedBox(height: 20.h,),
                      state is PostDetailsCommentsEmptyState
                          ?Center(
                            child: Text(
                        StringsManager.noComments,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700
                        ),
                      ),
                          )
                          :ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context , index)=>CommentItem(
                              comment: cubit.comments[index]
                          ),
                          separatorBuilder: (context , index)=>SizedBox(height: 16.h,),
                          itemCount: cubit.comments.length
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

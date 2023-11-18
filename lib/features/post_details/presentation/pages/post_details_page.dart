import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twasol/core/DI/dependency_injection.dart';
import 'package:twasol/features/post_details/presentation/manager/post_details_cubit.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt.get<PostDetailsCubit>()
        ..getComments(85433),
      child: BlocConsumer<PostDetailsCubit, PostDetailsStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(),
          );
        },
      ),
    );
  }
}

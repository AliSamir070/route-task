import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twasol/core/DI/dependency_injection.dart';
import 'package:twasol/core/utils/routes_manager.dart';
import 'package:twasol/features/home/presentation/manager/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt.get<HomeCubit>()
        ..GetPosts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.postDetailsRoute);
                }, child: Text("test")),),
          );
        },
      ),
    );
  }
}

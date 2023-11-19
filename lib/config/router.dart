import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twasol/core/utils/routes_manager.dart';
import 'package:twasol/features/home/data/models/PostModel.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/post_details/presentation/pages/post_details_page.dart';

class MyRouter{
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesManager.homeRoute:return MaterialPageRoute(builder: (_){
        return const HomePage();
      });
      case RoutesManager.postDetailsRoute:return MaterialPageRoute(builder: (_){
        return  PostDetailsPage(post: settings.arguments as PostModel,);
      });
      /*default:return MaterialPageRoute(builder: (_){
        return  const Scaffold(
          body: Center(child: Text("Something went wrong"),),
        );
      });*/
    }
  }
}
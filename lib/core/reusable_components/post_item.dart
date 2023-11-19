
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twasol/core/utils/routes_manager.dart';
import 'package:twasol/features/home/data/models/PostModel.dart';

import '../utils/asset_manager.dart';
import '../utils/color_manager.dart';
import '../utils/strings_manager.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final bool isDetails;
  const PostItem({Key? key,required this.post , this.isDetails = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorManager.primaryColor,
              radius: 25.r,
              child: SvgPicture.asset(
                (post.user?.gender??"")=="female"
                    ?AssetManager.womanAvatar
                    :AssetManager.manAvatar,
                height: 24.h,
                width: 24.w,
              ),
            ),
            SizedBox(width: 10.w,),
            Expanded(
                child: Text(
                  post.user?.name??"User Name",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            )
          ],
        ),
        SizedBox(height: 16.h,),
        GestureDetector(
          onTap: !isDetails
              ?(){
            Navigator.pushNamed(context, RoutesManager.postDetailsRoute,arguments: post);
          }
              :null,
          child: Text(
            post.title??"",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: 10.h,),
        isDetails
            ?Text(
        post.body??"",
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w400
    ),
    )
            :TextButton(
            onPressed: (){
              Navigator.pushNamed(context, RoutesManager.postDetailsRoute,arguments: post);
            },
            child: Text(
              StringsManager.showMore,
              style: Theme.of(context).textTheme.titleSmall,
            )
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twasol/core/utils/strings_manager.dart';
import 'package:twasol/features/post_details/data/models/CommentModel.dart';

import '../../../../core/utils/asset_manager.dart';
import '../../../../core/utils/color_manager.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;
  const CommentItem({Key? key,required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r)
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.primaryColor,
            radius: 20.r,
            child: SvgPicture.asset(
             AssetManager.manAvatar,
              height: 16.h,
              width: 16.w,
            ),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.name??StringsManager.userName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10.h,),
                Text(
                  comment.body??"",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

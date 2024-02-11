import '../models/learnsection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';

// ignore: must_be_immutable
class LearnsectionItemWidget extends StatelessWidget {
  LearnsectionItemWidget(
    this.learnsectionItemModelObj, {
    Key? key,
    this.navigatetoLearnContent,
  }) : super(
          key: key,
        );

  LearnsectionItemModel learnsectionItemModelObj;

  VoidCallback? navigatetoLearnContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: learnsectionItemModelObj?.skyImage,
          height: 113.v,
          width: 353.h,
          onTap: () {
            navigatetoLearnContent!.call();
          },
        ),
        SizedBox(height: 5.v),
        Text(
          learnsectionItemModelObj.skyText!,
          style: theme.textTheme.titleLarge,
        ),
      ],
    );
  }
}

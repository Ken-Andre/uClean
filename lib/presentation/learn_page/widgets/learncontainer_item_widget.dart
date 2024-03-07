import '../models/learncontainer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';

// ignore: must_be_immutable
class LearncontainerItemWidget extends StatelessWidget {
  LearncontainerItemWidget(
    this.learncontainerItemModelObj, {
    Key? key,
    this.onTapTheBeautyOfThe,
  }) : super(
          key: key,
        );

  LearncontainerItemModel learncontainerItemModelObj;

  VoidCallback? onTapTheBeautyOfThe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapTheBeautyOfThe!.call();
      },
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: learncontainerItemModelObj.image,
            height: 113.v,
            width: 353.h,
          ),
          SizedBox(height: 5.v),
          Text(
            learncontainerItemModelObj.theBeautyOfThe!,
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

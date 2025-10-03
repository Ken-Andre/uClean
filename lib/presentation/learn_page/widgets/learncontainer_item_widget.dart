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
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.whiteA70001,
          borderRadius: BorderRadius.circular(16.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.h),
                topRight: Radius.circular(16.h),
              ),
              child: CustomImageView(
                imagePath: learncontainerItemModelObj.image,
                height: 180.v,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    learncontainerItemModelObj.theBeautyOfThe!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward,
                          size: 16,
                          color: appTheme.cyan800),
                      SizedBox(width: 4.h),
                      Text(
                        "Read more",
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: appTheme.cyan800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '../models/titleunclasslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';

// ignore: must_be_immutable
class TitleunclasslistItemWidget extends StatelessWidget {
  TitleunclasslistItemWidget(
    this.titleunclasslistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TitleunclasslistItemModel titleunclasslistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 6.v,
              bottom: 7.v,
            ),
            child: SizedBox(
              width: 143.h,
              child: Divider(),
            ),
          ),
          Text(
            titleunclasslistItemModelObj.text1!,
            style: CustomTextStyles.bodySmallInter_1,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6.v,
              bottom: 7.v,
            ),
            child: SizedBox(
              width: 143.h,
              child: Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

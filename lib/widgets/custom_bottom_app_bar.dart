import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgLeftLightGreen200,
        activeIcon: ImageConstant.imgLeftLightGreen200,
        type: BottomBarEnum.Leftlightgreen200,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgStatsUp,
      activeIcon: ImageConstant.imgStatsUp,
      type: BottomBarEnum.Statsup,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCogPrimary,
      activeIcon: ImageConstant.imgCogPrimary,
      type: BottomBarEnum.Cogprimary,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: SizedBox(
        height: 86.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomMenuList.length,
            (index) {
              return InkWell(
                onTap: () {
                  for (var element in bottomMenuList) {
                    element.isSelected = false;
                  }
                  bottomMenuList[index].isSelected = true;
                  widget.onChanged?.call(bottomMenuList[index].type);
                  setState(() {});
                },
                child: bottomMenuList[index].isSelected
                    ? CustomImageView(
                        imagePath: bottomMenuList[index].activeIcon,
                        height: 28.v,
                        width: 106.h,
                        color: appTheme.lightGreen200,
                      )
                    : CustomImageView(
                        imagePath: bottomMenuList[index].icon,
                        height: 28.v,
                        width: 25.h,
                        color: appTheme.whiteA70001,
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Leftlightgreen200,
  Statsup,
  Cogprimary,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

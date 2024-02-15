import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgLeftPrimary,
        activeIcon: ImageConstant.imgLeftPrimary,
        type: BottomBarEnum.Leftprimary,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgStatsUpPrimary,
      activeIcon: ImageConstant.imgStatsUpPrimary,
      type: BottomBarEnum.Statsupprimary,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCogPrimary1,
      activeIcon: ImageConstant.imgCogPrimary1,
      type: BottomBarEnum.Cogprimary1,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: appTheme.blueGray900.withOpacity(0.87),
      child: SizedBox(
        height: 83.v,
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
                        color: theme.colorScheme.primary,
                      )
                    : CustomImageView(
                        imagePath: bottomMenuList[index].icon,
                        height: 28.v,
                        width: 25.h,
                        color: theme.colorScheme.primary,
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
  Leftprimary,
  Statsupprimary,
  Cogprimary1,
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
      color: Colors.white,
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

import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeLightGreen200,
      activeIcon: ImageConstant.imgHomeLightGreen200,
      type: BottomBarEnum.Homelightgreen200,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVector,
      activeIcon: ImageConstant.imgVector,
      type: BottomBarEnum.Vector,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCirclePlus,
      activeIcon: ImageConstant.imgCirclePlus,
      type: BottomBarEnum.Circleplus,
    ),
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
    return Container(
      height: 49.v,
      decoration: BoxDecoration(
        color: appTheme.blueGray900,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(5.h),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 24.v,
              width: 26.h,
              color: theme.colorScheme.primary,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: appTheme.lightGreen200,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Homelightgreen200,
  Vector,
  Circleplus,
  Statsup,
  Cogprimary,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
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

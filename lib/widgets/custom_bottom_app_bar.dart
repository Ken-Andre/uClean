import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int selectedIndex = 0;
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgUserBlueGray900,
      activeIcon: ImageConstant.imgUserBlueGray900,
      // tooltip: 'lbl_home'.tr,
      type: BottomBarEnum.Userbluegray900,
      isSelected: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.learn,
      activeIcon: ImageConstant.imgContrastGray60001,
      // tooltip: 'lbl_learn'.tr,
      type: BottomBarEnum.Contrastgray60001,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVector,
      activeIcon: ImageConstant.imgVector,
      // tooltip: 'lbl_stats'.tr,
      type: BottomBarEnum.Vector,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgLockGray60001,
      activeIcon: ImageConstant.imgLockGray60001,
      // tooltip: 'lbl_settings'.tr,
      type: BottomBarEnum.Lockgray60001,
    )
    // BottomMenuModel(
    //   icon: ImageConstant.imgStatsUp,
    //   activeIcon: ImageConstant.imgStatsUp,
    //   type: BottomBarEnum.Statsup,
    // ),
    // BottomMenuModel(
    //   icon: ImageConstant.imgCogPrimary,
    //   activeIcon: ImageConstant.imgCogPrimary,
    //   type: BottomBarEnum.Cogprimary,
    // )
  ];

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: CircularNotchedRectangle(),
//       child: SizedBox(
//         height: 86.v,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(
//             bottomMenuList.length,
//             (index) {
//               return InkWell(
//                 onTap: () {
//                   for (var element in bottomMenuList) {
//                     element.isSelected = false;
//                   }
//                   bottomMenuList[index].isSelected = true;
//                   widget.onChanged?.call(bottomMenuList[index].type);
//                   setState(() {});
//                 },
//                 child: bottomMenuList[index].isSelected
//                     ? CustomImageView(
//                         imagePath: bottomMenuList[index].activeIcon,
//                         height: 28.v,
//                         width: 106.h,
//                         color: appTheme.lightGreen200,
//                       )
//                     : CustomImageView(
//                         imagePath: bottomMenuList[index].icon,
//                         height: 28.v,
//                         width: 25.h,
//                         color: appTheme.whiteA70001,
//                       ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// enum BottomBarEnum {
//   Leftlightgreen200,
//   Statsup,
//   Cogprimary,
// }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.v,
      // shape: CircularNotchedRectangle(),
      // decoration: BoxDecoration(
      //   color: theme.colorScheme.primary,
      //   border: Border(
      //     top: BorderSide(
      //       color: theme.colorScheme.primary,
      //       width: 1.h,
      //     ),
      //   ),
      // ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: appTheme.gray60001,
            ),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              decoration: AppDecoration.fillCyanCc.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder20,
              ),
              child: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 24.adaptSize,
                width: 24.adaptSize,
                color: appTheme.blueGray900,
                margin: EdgeInsets.symmetric(vertical: 8.v),
              ),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          for (var element in bottomMenuList) {
            element.isSelected = false;
          }
          selectedIndex = index;
          bottomMenuList[index].isSelected =true;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}
enum BottomBarEnum {
  Userbluegray900,
  Contrastgray60001,
  // Television,
  Vector,
  Lockgray60001,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    // required this.tooltip,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  // String tooltip;

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

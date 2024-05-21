import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
  });

  String icon;

  String activeIcon;

  String? title;
}

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class DashboardNavigationScreen extends ConsumerWidget {
  /// Constructs an [DashboardNavigationScreen].
  DashboardNavigationScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final StatefulNavigationShell navigationShell;

  final List<BottomMenuModel> _bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.svgHomeTab,
      activeIcon: ImageConstant.svgHomeTab,
      title: "Home",
    ),
    BottomMenuModel(
      icon: ImageConstant.svgLoansTab,
      activeIcon: ImageConstant.svgLoansTab,
      title: "Loans",
    ),
    BottomMenuModel(
      icon: ImageConstant.svgMenuTab,
      activeIcon: ImageConstant.svgMenuTab,
      title: "Menu",
    ),
    BottomMenuModel(
      icon: ImageConstant.svgProfileTab,
      activeIcon: ImageConstant.svgProfileTab,
      title: "Profile",
    )
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appTheme.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: List.generate(_bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: _bottomMenuList[index].icon,
                  height: 24.h,
                  width: 24.w,
                  color: appTheme.neutral100,
                ),
                Text(
                  _bottomMenuList[index].title ?? "",
                  style: CustomTextStyles.bodyXSmallGrotesk_12x4.copyWith(
                    height: getLineHeight(lineHeight: 19.2, fontSize: 12),
                    letterSpacing: -0.5,
                    color: appTheme.neutral100,
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: _bottomMenuList[index].activeIcon,
                  height: 24.h,
                  width: 24.w,
                  color: appTheme.primary60,
                ),
                Text(
                  _bottomMenuList[index].title ?? "",
                  style: CustomTextStyles.bodyXSmallGrotesk_12x4.copyWith(
                    height: getLineHeight(lineHeight: 19.2, fontSize: 12),
                    letterSpacing: -0.5,
                    color: appTheme.primary60,
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        currentIndex: navigationShell.currentIndex,
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

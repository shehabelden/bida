import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/layout/layout_controller.dart';
import '../../helpers/constants.dart';
import '../compass/compass_screen.dart';
import '../home/home_screen.dart';
import '../notifications/notification_screen.dart';
import '../profile/profile_screen.dart';

class LayoutScreen extends GetWidget<LayoutController> {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<LayoutController>(
          builder: (controller) {
            return IndexedStack(
              index: controller.index,
              children: [
                HomeScreen(),
                CompassScreen(),
                NotificationScreen(),
                ProfileScreen(),
              ],
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          color: Colors.white,
          child: GNav(
            onTabChange: controller.onTapChange,
            gap: 10,
            tabBorderRadius: 12,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            tabBackgroundColor: k_primaryColor,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home'.tr,
              ),
              GButton(
                icon: LineIcons.compass,
                text: 'Compass'.tr,
              ),
              GButton(
                icon: LineIcons.bell,
                text: 'Notifications'.tr,
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile'.tr,
              )
            ],
          ),
        ),
      ),
    );
  }
}

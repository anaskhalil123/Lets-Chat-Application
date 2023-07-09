import 'package:firebase_chating/common/values/values.dart';
import 'package:firebase_chating/pages/application/controller.dart';
import 'package:firebase_chating/pages/contact/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  Widget _buildPageView(){
    return PageView(
      physics: NeverScrollableScrollPhysics(), // stop the scrolling with touch
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: [
        Container(child: Text("chat"),),
        ContactPage(),
        Container(child: Text("profile"),),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      ()=> BottomNavigationBar(
      items: controller.bottomTabs,
      currentIndex: controller.state.page,
      type: BottomNavigationBarType.fixed,
      onTap: controller.handleNavBarTap,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedItemColor: AppColors.tabBarElement,
      selectedItemColor: AppColors.thirdElementText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

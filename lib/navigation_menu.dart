import 'package:collect_life_game/screens/home/home_screen.dart';
import 'package:collect_life_game/screens/my_bag/my_bag_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (value) =>
              controller.selectedIndex.value = value,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.balance),
              label: 'Đầu tư',
            ),
            NavigationDestination(
              icon: const Icon(Icons.store),
              label: 'Cửa hàng',
            ),
            NavigationDestination(
              icon: const Icon(Icons.home),
              label: 'Thu thập',
            ),
            NavigationDestination(
              icon: const Icon(Icons.shopping_bag),
              label: 'Túi đồ',
            ),
            NavigationDestination(
              icon: const Icon(Icons.person),
              label: 'Hồ sơ',
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 2.obs;
  final screens = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    const HomeScreen(),
    const MyBagScreen(),
    Container(
      color: Colors.yellow,
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/base/controller/navigation_controller.dart';
import 'package:greengrocer/src/pages/cart/cart_tab.dart';
import 'package:greengrocer/src/pages/home/view/home_tab.dart';
import 'package:greengrocer/src/pages/orders/orders_tab.dart';
import 'package:greengrocer/src/pages/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navigationController.pageController,
        children: [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: (index) {
              navigationController.navigatePageView(index);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: navigationController.currentIndex,
            backgroundColor: Colors.green,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withAlpha(100),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Carrinho'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pedidos'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
            ],
          )),
    );
  }
}

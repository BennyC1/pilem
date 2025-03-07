import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilem/screens/favorite_screen.dart';
import 'package:pilem/screens/home_screen.dart';
import 'package:pilem/screens/search_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pilem',
        theme: ThemeData(primaryColorDark: Colors.blue),
        home: const MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
    bottomNavigationBar: Obx(
      () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          indicatorColor: Colors.deepOrangeAccent,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.heart_broken), label: 'Favorite'),
            NavigationDestination(
                icon: Icon(Icons.search), label: 'Search'),

                
          ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const SearchScreen()
  ];
}
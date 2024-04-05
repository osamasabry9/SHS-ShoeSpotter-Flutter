import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoe_spotter/core/utils/constants/sizes.dart';

import '../utils/constants/colors.dart';
import '../utils/helpers/helper_functions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  onTapChange(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController!.index = _selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('Store')),
          Center(child: Text('Wishlist')),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: onTapChange,
        height: AppSizes.navigationBarHeight,
        backgroundColor: dark ? AppColors.dark : AppColors.white,
        indicatorColor: dark
            ? AppColors.white.withOpacity(0.1)
            : AppColors.black.withOpacity(0.1),
        elevation: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.shop),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.heart),
            label: 'Wishlist',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

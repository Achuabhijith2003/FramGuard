import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/color.dart';
import '../utils/image.dart';
import 'main_screen/dashboard.dart';
// import 'main_screen/owner_profile_screen.dart';
import 'main_screen/pet_list_screen.dart';

final Color inActiveIconColor = AppColor.kGrayscale40;

class CustomNavBarCurved extends StatefulWidget {
  const CustomNavBarCurved({super.key});

  @override
  State<CustomNavBarCurved> createState() => _CustomNavBarCurvedState();
}

class _CustomNavBarCurvedState extends State<CustomNavBarCurved> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    if (!mounted) return; // Ensure the widget is still mounted
    setState(() {
      currentSelectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final pages = [Dashboard(), PetListScreen()];
  // OwnerProfileScreen()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set to 'Home'
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF22C55E), // green-500
        unselectedItemColor: const Color(0xFF64748B), // slate-500
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in_outlined),
            label: 'Certificates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_outlined),
            label: 'Advisor',
          ),
        ],
      ),
    );
  }
}

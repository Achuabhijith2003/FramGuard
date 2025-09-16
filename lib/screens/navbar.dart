import 'package:farmguard/screens/Seller/Seller_home.dart';
import 'package:farmguard/screens/Seller/seller_remaster_home.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../utils/color.dart';
// import '../utils/image.dart';
import 'main_screen/certificates.dart';
import 'main_screen/dashboard.dart';
// import 'main_screen/owner_profile_screen.dart';

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

  final pages = [Dashboard(), CertificatesScreen(), SellerRemasterHome()];
  // OwnerProfileScreen()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
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

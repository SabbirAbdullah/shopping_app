import 'package:ecommerce_mobile_app/utilis/constants.dart';
import 'package:ecommerce_mobile_app/screens/Cart/cart_screen.dart';
import 'package:ecommerce_mobile_app/screens/Home/home_screen.dart';
import 'package:ecommerce_mobile_app/screens/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'Favorite/favorite.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int cuttentIndex = 0;
    List screens = const [
      HomeScreen(),
      Favorite(),
      CartScreen(),
      Profile(),
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: cuttentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: cuttentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 2;
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: cuttentIndex == 2 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 3;
                });
              },
              icon: Icon(
                Icons.person_2_outlined,
                size: 30,
                color: cuttentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      body: screens[cuttentIndex],
    );
  }
}

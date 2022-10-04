
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  int _page =0;
  late PageController pageController;

  @override
  void initState(){
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();

  }

  void navigationTapped(int page,BuildContext context ){

    pageController.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState((){
      _page = page;
    });
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged:onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: bottomNavigationBarItems,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.cyan,
        selectedItemColor: Colors.pink,
        currentIndex: _page,
        onTap: (page) {navigationTapped(page,context);},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "home",),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "More"),
        ],
      ),
    );
  }
}

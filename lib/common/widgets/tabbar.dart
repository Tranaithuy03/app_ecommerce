import 'package:flutter/material.dart';
class MPTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MPTabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.blueAccent,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.blueAccent,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:globelink/core/constants/assets/assets_icons.dart';
import 'package:globelink/core/constants/assets/assets_images.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.appbarBg),
          fit: BoxFit.cover,
        ),
      ),
      child: AppBar(
        leading: Image.asset(AssetsIcons.homWhite),
        title: Image.asset(
          AssetsImages.logo2,
        ),
        actions: [
          IconButton(
            onPressed: () => _openDrawer(context),
            icon: const Icon(
              Icons.menu,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

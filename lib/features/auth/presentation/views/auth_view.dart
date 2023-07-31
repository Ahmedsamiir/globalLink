import 'package:flutter/material.dart';
import 'package:globelink/core/constants/assets/assets_icons.dart';
import 'package:globelink/core/theme/colors/primary_colors.dart';
import 'package:globelink/core/utils/models/screen_body.dart';
import 'package:globelink/features/auth/presentation/views/widgets/another_pasword_reset/another_password_reset_body.dart';
import 'package:globelink/features/auth/presentation/views/widgets/auth/auth_body.dart';
import 'package:globelink/features/auth/presentation/views/widgets/password_reset/password_reset_body.dart';
import 'package:globelink/features/home/presentation/views/widgets/home/home_drawer.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final PageController _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

  void _navigateToPage(int index, BuildContext context) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    Navigator.pop(context);
  }

  void _openDrawer(BuildContext context) {
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ScreenBody> pages = [
      ScreenBody(
        body:  AuthBody( navigateTo: (val) => navigateToPage(val, context)),
      ),
      ScreenBody(
        body: PasswordResetBody(
          navigateTo: (val) => navigateToPage(val, context),
        ),
      ),
      ScreenBody(
        body: AnotherPasswordResetBody(
          navigateTo: (val) => navigateToPage(val, context),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xff286EDA),
      appBar: AppBar(
        leading: Image.asset(AssetsIcons.homWhite),
        title: const Text("My Account"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff55A9FF),
                PrimaryColors.royalBlue,
                Color(0xff286EDA),
              ],
            ),
          ),
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
      body: PageView(
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages
            .map<Widget>((page) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: page.body,
                ))
            .toList(),
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
      endDrawer: HomeDrawer(
        onItemTap: (index) => _navigateToPage(index, context),
      ),
    );
  }

  void navigateToPage(int index, BuildContext context) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    // void _navigateToPage(int index, BuildContext context) {
    //   setState(() {
    //     _currentPageIndex = index;
    //   });
    //   _pageController.animateToPage(
    //     index,
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.easeInOut,
    //   );
    //   Navigator.pop(context);
    // }
  }
}

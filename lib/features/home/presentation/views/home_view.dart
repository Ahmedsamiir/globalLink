import 'package:flutter/material.dart';
import 'package:globelink/core/constants/assets/assets_icons.dart';
import 'package:globelink/core/constants/assets/assets_images.dart';
import 'package:globelink/features/home/presentation/views/widgets/about/about_body.dart';
import 'package:globelink/features/home/presentation/views/widgets/home/home_body.dart';
import 'package:globelink/features/home/presentation/views/widgets/home/home_drawer.dart';
import 'package:globelink/features/home/presentation/views/widgets/products/products_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> titles = [
    Image.asset(
      AssetsImages.logo2,
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("About"),
        Text("About Globelink Travel Insurance"),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Globelink"),
        Text("Travel Insurance Products"),
      ],
    ),
  ];
  List<dynamic> pages = [
    {
      'backgroundColor': HomeBody.backgroundColor,
      'child': const HomeBody(),
    },
    {
      'backgroundColor': AboutBody.backgroundColor,
      'child': const AboutBody(),
    },
    {
      'backgroundColor': ProductsBody.backgroundColor,
      'child': const ProductsBody(),
    },
  ];
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Image.asset(AssetsIcons.homWhite),
        title: titles[_currentPageIndex],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff55A9FF),
                Color(0xff3A7FE8),
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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: page["backgroundColor"],
                    ),
                  ),
                  child: page['child'],
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
}

import 'package:flutter/material.dart';
import 'package:globelink/core/constants/assets/assets_images.dart';
import 'package:globelink/features/home/presentation/views/widgets/home/item_option.dart';
import 'package:globelink/features/home/presentation/views/widgets/home/user_info_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  static List<Color> backgroundColor = [
    const Color(0xffEEF5FF),
    const Color(0xffEEF5FF),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          const UserInfoCard(),
          const SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              ItemOption(
                image: AssetsImages.about,
                color: const Color(0xff10C07F),
                title: "Download your Policy",
                content: "Click here to view list of your policies",
                onTap: () {},
              ),
              ItemOption(
                image: AssetsImages.quote,
                color: const Color(0xff428DFF),
                title: "Get a New Quote",
                content: "Need decent cover? \nGet yours in a few easy steps!",
                onTap: () {},
              ),
              ItemOption(
                image: AssetsImages.claim,
                color: const Color(0xffFF973A),
                title: "Make a Claim",
                content: "Need to claim? \nClick here for details",
                onTap: () => {},
              ),
              ItemOption(
                image: AssetsImages.about,
                color: const Color(0xff9072EE),
                title: "Take to the App Tour",
                content: "Watch a short video on how to use the app",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

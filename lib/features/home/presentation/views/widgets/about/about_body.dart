import 'package:flutter/material.dart';
import 'package:globelink/core/constants/assets/assets_images.dart';
import 'package:globelink/core/widgets/circular_button.dart';

const dummyText =
    "We’ve been selling travel insurance since 1996 and are proud to have provided insurance peace of mind for millions of trips in that time. Travel insurance may not be the most exciting part of planning your travels but it is one of the most essential. So we do our best to make the process of getting the right cover online simple and quick.";
const dummyText2 =
    "Our policies are available to all UK and EU residents plus Liechtenstein and Norway. We cover travellers (up to age 89), so whether you are going on holiday, working abroad, a gap year student, expat, taking a one-way trip, or have already travelled, we can get you covered.";

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});
  static List<Color> backgroundColor = [
    const Color(0xffEEF5FF),
    const Color(0xffEEF5FF),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetsImages.star),
          const SizedBox(height: 15),
          Text(
            "93% of our customers rate their customer experience as excellent or great",
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
          Text(
            dummyText,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium
                ?.copyWith(color: const Color(0xff585858)),
          ),
          const SizedBox(height: 15),
          Text(
            dummyText2,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium
                ?.copyWith(color: const Color(0xff585858)),
          ),
          const Spacer(),
          CircularButton(
            title: "Get a quote",
            onTap: () {},
          ),
          const SizedBox(height: 10),
          CircularButton(
            title: "Visit website",
            isOutlined: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:globelink/core/constants/assets/assets_images.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Regular",
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      Image.asset(AssetsImages.bookmark),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 12,
                            ),
                            const SizedBox(width: 6),
                            Row(
                              children: [
                                Text(
                                  "from",
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff3F3D3D),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "\$14.08",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff3F3D3D),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Single Trip Insurance",
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff3F3D3D),
                ),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  "Best if you take one holiday or only travelling to one destination",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0XFF646464),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

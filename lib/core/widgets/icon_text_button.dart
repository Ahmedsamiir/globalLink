import 'package:flutter/material.dart';
import 'package:globelink/core/constants/assets/assets_icons.dart';
import 'package:globelink/core/theme/colors/primary_colors.dart';

class IconTextButton extends StatelessWidget {
  final String icon;
  final String text;
  final Function onTap;

  const IconTextButton({
    super.key,
    this.icon = AssetsIcons.leftDoubleArrows,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(icon),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: theme.textTheme.labelLarge?.copyWith(
              color: PrimaryColors.dodgerBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

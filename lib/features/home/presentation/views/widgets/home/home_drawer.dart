import 'package:flutter/material.dart';
import 'package:globelink/core/constants/assets/assets_icons.dart';

class HomeDrawer extends StatelessWidget {
  final Function(int) onItemTap;
  const HomeDrawer({super.key, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            _buildListTile(
                theme, AssetsIcons.homeBlue, "Home", () => onItemTap(0)),
            _buildListTile(theme, AssetsIcons.policies, "View policies", () {}),
            _buildListTile(theme, AssetsIcons.quote, "Get a quote", () {}),
            _buildListTile(
                theme, AssetsIcons.claim, "Make a claim", () => onItemTap(2)),
            _buildListTile(theme, AssetsIcons.myAccount, "My account", () {}),
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
              color: Color(0xffEEF5FF),
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 20),
            _buildListTile(
                theme, AssetsIcons.aboutUs, "About us", () => onItemTap(1)),
            _buildListTile(theme, AssetsIcons.contactUs, "Contact us", () {}),
            _buildListTile(theme, AssetsIcons.website, "Visit website", () {}),
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
              color: Color(0xffEEF5FF),
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AssetsIcons.facebook),
                Image.asset(AssetsIcons.twitter),
                Image.asset(AssetsIcons.instagram),
                Image.asset(AssetsIcons.youtube),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
          ThemeData theme, String icon, String text, Function onTap) =>
      ListTile(
        leading: Image.asset(icon),
        title: Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff585858),
          ),
        ),
        onTap: () => onTap(),
      );
}

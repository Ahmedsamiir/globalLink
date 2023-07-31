import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

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
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back Denis!",
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Color(0xff646464),
                  ),
                  const SizedBox(width: 5),
                  Row(
                    children: [
                      Text(
                        "Your trip planned for ",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff646464),
                        ),
                      ),
                      Text(
                        "18 days",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffEEF5FF),
              ),
              _buildFlightInfoTile(theme, "From", 'Monday 12 September'),
              _buildFlightInfoTile(theme, "to", 'Friday 30 September'),
              const Divider(
                thickness: 2,
                color: Color(0xffEEF5FF),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.flight,
                    color: Color(0xff646464),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Your have ",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff646464),
                    ),
                  ),
                  Text(
                    "38 days",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    " to go",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff646464),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildFlightInfoTile(ThemeData theme, String title, String date) => Row(
      children: [
        Text(
          "$title ",
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff585858),
          ),
        ),
        Text(
          date,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: const Color(0xff65A2FF),
          ),
        ),
      ],
    );

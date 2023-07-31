import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final String title;
  final bool isOutlined;
  final Function onTap;
  const CircularButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor:
              !isOutlined ? const Color(0xffFFA85A) : const Color(0xffFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
            color: isOutlined ? const Color(0xffFFA85A) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            title.toUpperCase(),
            style: theme.textTheme.bodyLarge?.copyWith(
                color: isOutlined ? const Color(0xffFFA85A) : Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

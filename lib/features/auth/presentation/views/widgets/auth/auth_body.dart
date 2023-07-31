import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globelink/core/theme/colors/secondary_colors.dart';
import 'package:globelink/core/widgets/circular_button.dart';
import 'package:globelink/core/widgets/icon_text_button.dart';

import '../../../../../../core/utils/functions/hide_system_ui.dart';

class AuthBody extends StatefulWidget {
  final Function(int) navigateTo;

   AuthBody({super.key, required this.navigateTo});

  static List<Color> backgroundColor = [
    const Color(0xffEEF5FF),
    const Color(0xffEEF5FF),
  ];

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  final _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController(initialPage: 0);

  bool _passwordVisible = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  String emailValidationRegex =
      '''^[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?''';

  @override
  void initState() {
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  int _currentPageIndex = 1;

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconTextButton(
                    text: "Return to Wizard",
                    onTap: () {
                      // Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: Text(
                  "Existing Customers Login",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Please sign in to your account to manage your policy documents or to make a claim.",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: SecondaryColors.doveGray,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: emailController,
                focusNode: emailFocusNode,
                //cursorColor: Color(0xFFBDD7FF),
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Email is required';
                  }

                  if ((emailController.text.length > 50 || !RegExp(emailValidationRegex).hasMatch(emailController.text))) {
                    return 'Enter Correct E-mail';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Color(0xFFB6B9BD)),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(color: Color(0xFFBDD7FF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(color: Color(0xFFBDD7FF)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: passwordController,
                obscureText: !_passwordVisible,
                //focusNode: passwordFocusNode,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'password is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Color(0xFFB6B9BD)),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(color: Color(0xFFBDD7FF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(color: Color(0xFFBDD7FF)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xffBDD7FF),
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              CircularButton(
                title: "Sign in",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.transparent,
                        content: Center(
                          child: Text('Missing Data', style: TextStyle(fontSize: 20, color: Colors.orange)),
                        ),
                      ),
                    );

                    Utils.dismissKeyboard(context);
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  widget.navigateTo(1);
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF428DFF),
                ),
                child: Text(
                  "Forget your password?",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF428DFF),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Color(0xffEEF5FF),
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF428DFF),
                    ),
                    child: Text(
                      "Or sign in with",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF646464),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Color(0xffEEF5FF),
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: const BorderSide(color: Color(0xFFBDD7FF), width: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset("assets/icons/ic_google.png", fit: BoxFit.none),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'Google',
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: SecondaryColors.blackAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: const BorderSide(
                          color: SecondaryColors.periwinkle,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset("assets/icons/ic_facebook.png", fit: BoxFit.none,),
                          ),
                          const Text(
                            'Facebook',
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: SecondaryColors.blackAccent),
                          ),
                        ],
                      ),
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

// void _navigateToPage(int index, BuildContext context) {
//
//   _pageController.animateToPage(
//     index,
//     duration: const Duration(milliseconds: 300),
//     curve: Curves.easeInOut,
//   );
//   Navigator.pop(context);
// }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF428DFF),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF428DFF),
        ),
      ),
    );
  }
}

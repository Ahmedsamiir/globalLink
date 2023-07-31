import 'package:flutter/material.dart';
import 'package:globelink/core/theme/colors/secondary_colors.dart';
import 'package:globelink/core/utils/functions/hide_system_ui.dart';
import 'package:globelink/core/widgets/circular_button.dart';
import 'package:globelink/core/widgets/icon_text_button.dart';

class AnotherPasswordResetBody extends StatefulWidget {
  final Function(int) navigateTo;

  const AnotherPasswordResetBody({super.key, required this.navigateTo});

  static List<Color> backgroundColor = [
    const Color(0xffEEF5FF),
    const Color(0xffEEF5FF),
  ];

  @override
  State<AnotherPasswordResetBody> createState() => _AnotherPasswordResetBodyState();
}

class _AnotherPasswordResetBodyState extends State<AnotherPasswordResetBody> {
  final PageController _pageController = PageController(initialPage: 2);

  bool _passwordVisible = false;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    passwordController = TextEditingController(text: "");
    passwordFocusNode = FocusNode();
    confirmPasswordController = TextEditingController(text: "");
    confirmPasswordFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      // padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconTextButton(
                    text: "Existing Customer Login",
                    onTap: () {
                      widget.navigateTo(1);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 48),
              const Text(
                "Password Reset",
                style: TextStyle(color: SecondaryColors.blackAccent, fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Reset link has been sent to the e-mail you provided. please Enter a new password:",
                textAlign: TextAlign.center,
                maxLines: 2,
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                style: TextStyle(
                  color: SecondaryColors.doveGray,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: passwordController,
                focusNode: passwordFocusNode,
                //cursorColor: Color(0xFFBDD7FF),
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
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
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: confirmPasswordController,
                obscureText: !_passwordVisible,
                focusNode: confirmPasswordFocusNode,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'password is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
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
              const SizedBox(
                height: 180,
              ),
              CircularButton(
                title: "Sign In",
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
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToPage(int index, BuildContext context) {

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    Navigator.pop(context);
  }
}

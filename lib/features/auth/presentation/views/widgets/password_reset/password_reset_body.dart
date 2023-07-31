import 'package:flutter/material.dart';
import 'package:globelink/core/theme/colors/secondary_colors.dart';
import 'package:globelink/core/utils/functions/hide_system_ui.dart';
import 'package:globelink/core/widgets/circular_button.dart';
import 'package:globelink/core/widgets/icon_text_button.dart';

class PasswordResetBody extends StatefulWidget {
  final Function(int) navigateTo;

  const PasswordResetBody({super.key, required this.navigateTo});

  static List<Color> backgroundColor = [
    const Color(0xffEEF5FF),
    const Color(0xffEEF5FF),
  ];

  @override
  State<PasswordResetBody> createState() => _PasswordResetBodyState();
}

class _PasswordResetBodyState extends State<PasswordResetBody> {
  final PageController _pageController = PageController(initialPage: 1);

  late TextEditingController emailController;
  late FocusNode emailFocusNode;
  final _formKey = GlobalKey<FormState>();

  String emailValidationRegex =
      '''^[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?''';

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController(text: "");
    emailFocusNode = FocusNode();

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
                      widget.navigateTo(0);
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
                "Enter e-mail Address you have purchased your policy with with and we w'll send you an email containing reset link",
                textAlign: TextAlign.center,
                maxLines: 3,
                textHeightBehavior: TextHeightBehavior(leadingDistribution: TextLeadingDistribution.even),
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
                  hintText: 'E-mail',
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
              const SizedBox(
                height: 230,
              ),
              CircularButton(
                title: "Confirm",
                onTap: () {
                  if (_formKey.currentState!.validate()) {


                    Utils.dismissKeyboard(context);
                  }
                  widget.navigateTo(2);
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

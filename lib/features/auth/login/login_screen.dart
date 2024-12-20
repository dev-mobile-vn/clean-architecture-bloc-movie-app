
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/common/contants/routers.dart';
import '../../../core/common/widgets/button_widget.dart';
import '../../../core/common/widgets/svg_widget.dart';
import '../../../core/common/widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> isRememberMe = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    isRememberMe.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 24),
        child: Column(
          children: [
            const SvgWidget(ic: 'assets/icons/ic_logo.svg',),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Login to Your Account',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(
                      'assets/icons/ic_email.svg',
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 16, maxWidth: 32)),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(
                      'assets/icons/ic_password.svg',
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 16, maxWidth: 32),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Icon(Icons.visibility),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 48)),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<bool>(
                valueListenable: isRememberMe,
                builder: (ctx, value, child) {
                  return GestureDetector(
                    onTap: () {
                      isRememberMe.value = !value;
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 250),
                          firstChild: SvgPicture.asset(
                            'assets/icons/ic_checked.svg',
                            width: 16,
                            height: 16,
                          ),
                          secondChild: SvgPicture.asset(
                            'assets/icons/ic_unchecked.svg',
                            width: 16,
                            height: 16,
                          ),
                          crossFadeState: value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Remember me',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
                btnText: 'Login',
                action: () => Navigator.pushNamedAndRemoveUntil(context, mainRoute, (route) => false)),
            const SizedBox(
              height: 16,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '');
                },
                child: TextWidget(
                    data: 'Forgot the password?',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).primaryColor))),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Expanded(child: Divider()),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'or continue with',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Expanded(child: Divider()),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: Colors.grey,
                          ))),
                  child: SvgPicture.asset('assets/icons/facebook.svg'),
                ),
                const SizedBox(
                  width: 24,
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: Colors.grey,
                          ))),
                  child: SvgPicture.asset('assets/icons/google.svg'),
                ),
                const SizedBox(
                  width: 24,
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: Colors.grey,
                          ))),
                  child: SvgPicture.asset('assets/icons/apple.svg'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text:
                    TextSpan(text: 'Don’t have an account? ', style: Theme.of(context).textTheme.bodyMedium, children: [
              TextSpan(
                text: 'Sign up',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red),
                recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, signUpRoute),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

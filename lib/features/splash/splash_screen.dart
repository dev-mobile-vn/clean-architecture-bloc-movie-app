import 'package:flutter/material.dart';

import '../../core/common/contants/routers.dart';
import '../../core/common/widgets/svg_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, welComeRoute, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            SvgWidget(ic: 'assets/icons/ic_logo.svg',),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 54,
            ),
          ],
        ),
      ),
    );
  }
}

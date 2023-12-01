import 'package:escribo_test/views/home_view.dart';
import 'package:escribo_test/views/widgets/app_progress_indicator.dart';
import 'package:escribo_test/views/widgets/app_title.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((_) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeView())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTitle(),
            SizedBox(width: 16.0),
            AppProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

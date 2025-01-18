import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/constants/color_constants.dart';
import 'package:task_manager_app/core/constants/path_constants.dart';

import '../../domain/repositories/auth/auth_repository.dart';
import '../_widget/auth/title_widget.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Hide the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _checkUserLoginStatus();
  }

  Future<void> _checkUserLoginStatus() async {
    final isLoggedIn = await GetIt.I<AuthRepository>().isLoggedIn();

    isLoggedIn.fold(
      (failure) {
        // Handle database error (optional)
        debugPrint('Database error splash_view: $failure');
        context.go(PathConstants.loginView);
      },
      (loggedIn) {
        if (loggedIn) {
          context.go(PathConstants.todoView);
        } else {
          context.go(PathConstants.loginView);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Show the status bar
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleWidget(),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: ColorConstants.primaryElement,
            ),
          ],
        ),
      ),
    );
  }
}

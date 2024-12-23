import 'package:flutter/material.dart';
import 'package:flutter_pos_warehouse_app/ui/pos/pages/dashboard_pos_page.dart';

import '../../../core/core.dart';
import '../../../data/data_source/auth_local_data_source.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 3),
            () => AuthLocalDataSource().isUserLoggedIn(),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(80.0),
                child: Center(
                  child: Assets.images.logoWhite.image(),
                ),
              );
            } else if (snapshot.hasData && snapshot.data == true) {
              return const DashboardPosPage();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}

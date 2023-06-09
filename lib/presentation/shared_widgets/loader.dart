import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(gradient: AppColors.purpleBLue),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

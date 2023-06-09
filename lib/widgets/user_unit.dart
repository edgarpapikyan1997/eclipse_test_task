import 'package:flutter/material.dart';
import '../data/models/user_model.dart';
import '../presentation/theme/app_colors.dart';
import '../presentation/theme/app_text_styles.dart';

class UserUnit extends StatelessWidget {
  final UserModel user;

  const UserUnit({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            spreadRadius: 1,
            blurRadius: 8,
            // offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white.withOpacity(0.6),
        ),
        padding: const EdgeInsets.all(5),
        child: ListTile(
          horizontalTitleGap: 8,
          title: Text(
            user.username,
            style: AppTextStyles.title,
          ),
          subtitle: Text(
            user.name,
            style: AppTextStyles.subtitle,
          ),
          leading: const Icon(
            Icons.person,
            size: 32,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

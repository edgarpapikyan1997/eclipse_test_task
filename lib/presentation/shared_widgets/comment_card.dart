import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class CommentCard extends StatelessWidget {
  final String email;
  final String username;
  final String comment;

  const CommentCard({
    required this.email,
    required this.username,
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                spreadRadius: 2,
                color: Colors.white54,
                blurRadius: 4,),
          ],
          border: Border.all(
            color: const Color(0xFF243b55),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          ListTile(
            style: ListTileStyle.list,
            title: Text(username, style: AppTextStyles.bodyTextStyleWhite),
            subtitle: Text(email, style: AppTextStyles.bodyTextStyleWhite),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(comment,style: AppTextStyles.bodyTextStyleWhite),
          )
        ],
      ),
    );
  }
}

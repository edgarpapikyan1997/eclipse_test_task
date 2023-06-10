import 'package:eds_test/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import '../data/models/post_model.dart';
import '../data/models/user_model.dart';
import 'post_detail_page.dart';
import 'shared_widgets/post_card.dart';
import 'theme/app_colors.dart';
import 'theme/app_text_styles.dart';

class AllPostsPage extends StatefulWidget {
  final UserModel user;
  final List<PostModel> posts;

  const AllPostsPage({
    required this.user,
    required this.posts,
    Key? key,
  }) : super(key: key);

  @override
  State<AllPostsPage> createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: Text(widget.user.username),
      centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.purple, blurRadius: 20),
              BoxShadow(color: AppColors.blueDiff, blurRadius: 20)
            ],
            gradient: AppColors.purpleBLue,
          ),
        ),
        // backgroundColor: AppColors.green,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: AppColors.purpleBLue
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          itemCount: widget.posts.length,
          itemBuilder: (context, index) {
            final post = widget.posts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailPage(
                      post: post,
                    ),
                  ),
                );
              },
              child: PostCard(
                post: post,
              ),
            ).paddingOnly(bottom: 16);
          },
        ),
      ),
    );
  }
}

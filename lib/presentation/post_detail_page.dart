import 'package:eds_test/constants/app_words.dart';
import 'package:eds_test/data/models/post_model.dart';
import 'package:eds_test/data/services/api_service.dart';
import 'package:eds_test/extensions/widget_extension.dart';
import 'package:eds_test/mixins/after_layout.dart';
import 'package:eds_test/presentation/shared_widgets/comment_card.dart';
import 'package:eds_test/presentation/shared_widgets/custom_text_field.dart';
import 'package:eds_test/presentation/shared_widgets/loader.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:eds_test/store/loading_state/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/post_detail_state/post_detail_state.dart';

class PostDetailPage extends StatefulWidget {
  final PostModel post;

  const PostDetailPage({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> with AfterLayoutMixin {
  final _postDetailState = PostDetailState();
  final _loadingState = LoadingState();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadingState.startLoading();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await _postDetailState.getCommentsByPostId(postId: widget.post.id);
    _loadingState.stopLoading();
  }

  void _clearText() {
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: Observer(
        builder: (_) => _loadingState.isLoading
            ? const Loader()
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Text(
                          widget.post.title,
                          style: AppTextStyles.title.copyWith(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          widget.post.body,
                          style: AppTextStyles.bodyTextStyle.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('${AppWords.comments}:'),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        final comment = _postDetailState.comments[index];
                        return CommentCard(
                          username: comment.name,
                          comment: comment.body,
                          email: comment.email,
                        );
                      },
                      childCount: _postDetailState.comments.length,
                    ),
                  ),
                ],
              ).paddingAll(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 20,
        ),
        onPressed: () => _displayDialog(context),
      ),
    );
  }

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          scrollable: true,
          title: const Text(AppWords.addNewComment),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                    hintText: AppWords.name,
                    validatorMessage: AppWords.nameCannotBeEmpty,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: emailController,
                    prefixIcon: const Icon(Icons.email),
                    hintText: AppWords.email,
                    validatorMessage: AppWords.emailCannotBeEmpty,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: commentController,
                    prefixIcon: const Icon(Icons.message),
                    hintText: AppWords.comment,
                    validatorMessage: AppWords.commentCannotBeEmpty,
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(AppWords.submit),
              onPressed: () {
                ApiService.sendComment(
                  name: nameController.text,
                  email: emailController.text,
                  body: commentController.text,
                );
                Navigator.of(context).pop();
                _clearText();
              },
            )
          ],
        );
      },
    );
  }
}

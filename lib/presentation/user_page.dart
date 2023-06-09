import 'package:eds_test/constants/app_words.dart';
import 'package:eds_test/data/models/user_model.dart';
import 'package:eds_test/mixins/after_layout.dart';
import 'package:eds_test/presentation/album_detail_page.dart';
import 'package:eds_test/presentation/all_albums_page.dart';
import 'package:eds_test/presentation/all_posts_page.dart';
import 'package:eds_test/presentation/post_detail_page.dart';
import 'package:eds_test/presentation/shared_widgets/album_card.dart';
import 'package:eds_test/presentation/shared_widgets/loader.dart';
import 'package:eds_test/presentation/shared_widgets/post_card.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:eds_test/store/loading_state/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/user_page_state/user_page_state.dart';

class UserPage extends StatefulWidget {
  final UserModel userModel;

  const UserPage({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with AfterLayoutMixin {
  final _loadingState = LoadingState();
  final _userPageState = UserPageState();

  @override
  void initState() {
    super.initState();
    _loadingState.startLoading();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await _userPageState.getPostsByUserId(
      userId: widget.userModel.id,
    );
    await _userPageState.getAlbumsByUserIdWithPhotos(
      userId: widget.userModel.id,
    );
    _loadingState.stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(widget.userModel.username),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: Observer(
        builder: (_) => _loadingState.isLoading
            ? const Loader()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppWords.name}: ${widget.userModel.name}',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${AppWords.email}: ${widget.userModel.email}',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${AppWords.phone}: ${widget.userModel.phone}',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${AppWords.website}: ${widget.userModel.website}',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppWords.workingCompany,
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${AppWords.name}: ${widget.userModel.company.name}',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'BS: ${widget.userModel.company.bs}',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "${AppWords.catchPhase}: '${widget.userModel.company.catchPhrase}'",
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppWords.address,
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      '${AppWords.city}: ${widget.userModel.address.city}',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      '${AppWords.street}: ${widget.userModel.address.street}',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppWords.userPosts,
                            style: AppTextStyles.bodyTextStyle,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllPostsPage(
                                  user: widget.userModel,
                                  posts: _userPageState.posts,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    ///todo change list view to sliverList delegate Sliver
                    ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) {
                        final post = _userPageState.posts[index];
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
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppWords.userAlbums,
                            style: AppTextStyles.bodyTextStyle,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllAlbumsPage(
                                  user: widget.userModel,
                                  albums: _userPageState.albums,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    ///todo change list view to sliverList delegate Sliver
                    ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) {
                        final album = _userPageState.albums[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlbumDetailPage(
                                  album: album,
                                ),
                              ),
                            );
                          },
                          child: AlbumCard(
                            album: album,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

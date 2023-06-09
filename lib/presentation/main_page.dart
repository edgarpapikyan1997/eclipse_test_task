import 'package:eds_test/constants/app_words.dart';
import 'package:eds_test/extensions/widget_extension.dart';
import 'package:eds_test/mixins/after_layout.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:eds_test/presentation/user_page.dart';
import 'package:eds_test/store/loading_state/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/main_page_state/main_page_state.dart';
import '../widgets/user_unit.dart';
import 'shared_widgets/loader.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AfterLayoutMixin {
  final _mainState = MainState();
  final _loadingState = LoadingState();

  @override
  void initState() {
    super.initState();
    _loadingState.startLoading();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await _mainState.getAllUsers();
    _loadingState.stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          AppWords.allUsers,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
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
      body: Observer(
        builder: (_) => _loadingState.isLoading
            ? const Loader()
            : DecoratedBox(
                decoration: const BoxDecoration(gradient: AppColors.purpleBLue),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _mainState.users.length,
                  itemBuilder: (context, index) {
                    final user = _mainState.users[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(
                              userModel: user,
                            ),
                          ),
                        );
                      },
                      child: UserUnit(
                        user: user,
                      ),
                    ).paddingOnly(
                      bottom: 12,
                    );
                  },
                ),
              ),
      ),
    );
  }
}

import 'package:eds_test/data/models/user_model.dart';
import 'package:eds_test/data/services/api_service.dart';
import 'package:eds_test/extensions/widget_extension.dart';
import 'package:eds_test/mixins/after_layout.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:eds_test/presentation/user_page.dart';
import 'package:flutter/material.dart';

import '../widgets/user_unit.dart';
import 'shared_widgets/loader.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AfterLayoutMixin {
  List<UserModel> result = List.empty();
  bool _isLoading = true;

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    result = await ApiService.getAllUsers();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        gradient: AppColors.purpleBLue
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'All Users',
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
        body: _isLoading
            ? const Loader()
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: result.length,
                itemBuilder: (context, index) {
                  final user = result[index];
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
    );
  }
}

/// Reserve code for editing back
/// This fragment was replaced after GestureDetector's child
// Container(
//   color: AppColors.green,
//   padding: const EdgeInsets.all(10),
//   child: ListTile(
//     horizontalTitleGap: 8,
//     title: Text(
//       user.username,
//       style: AppTextStyles.title,
//     ),
//     subtitle: Text(
//       user.name,
//       style: AppTextStyles.subtitle,
//     ),
//     leading: const Icon(
//       Icons.person,
//       size: 32,
//       color: AppColors.white,
//     ),
//   ),
// ),

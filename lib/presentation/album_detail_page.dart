import 'package:carousel_slider/carousel_slider.dart';
import 'package:eds_test/data/models/album_model.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final AlbumModelWithPhotos album;

  const AlbumDetailPage({
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
    appBar: AppBar(
        title: Text(album.title),
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
          gradient: AppColors.purpleBLue,
        ),
        child: Center(
          child: CarouselSlider.builder(
            itemCount: album.photos.length,
            itemBuilder: (context, index, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Image.network(
                      album.photos[index].url,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(album.photos[index].title),
                  ],
                ),
              );
            },
            options: CarouselOptions(height: 400),
          ),
        ),
      ),
    );
  }
}

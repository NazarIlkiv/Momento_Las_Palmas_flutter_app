import 'package:flutter/material.dart';
import 'package:momento_las_palmas/core/constants/app_colors.dart';
import 'package:momento_las_palmas/core/widgets/buttons/favourites_button.dart';
import 'package:momento_las_palmas/home/data/models/places_model.dart';
import 'package:momento_las_palmas/tabs/blog/presentation/widgets/blog_button.dart';
import 'package:share_plus/share_plus.dart';

class PlaceInfoCard extends StatelessWidget {
  final PlaceItem place;

  const PlaceInfoCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
      width: 320,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.colorWhitePrimary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        color: AppColors.colorBlackPrimary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                place.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 8),
                  Text(
                    place.title,
                    style: const TextStyle(
                      color: AppColors.colorWhitePrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    place.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.colorWhitePrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Rating:",
                        style: TextStyle(
                          color: AppColors.colorWhitePrimary,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        place.rating,
                        style: const TextStyle(
                          color: AppColors.colorWhitePrimary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      BlogButton(
                        onTap: () {},
                        buttonText: 'Build Route',
                      ),
                      const Spacer(),
                      FavouriteButton(place: place),
                      const SizedBox(width: 12.0),
                      _buildShareButton(place.title),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildShareButton(String placeTitle) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.colorWhitePrimary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          onPressed: () => _shareText(placeTitle),
          icon: const Icon(Icons.share, color: AppColors.colorWhitePrimary),
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      );

  void _shareText(String placeTitle) {
    Share.share('My color is Yellow');
  }
}

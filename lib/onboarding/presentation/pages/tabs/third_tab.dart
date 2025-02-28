import 'package:flutter/material.dart';
import 'package:momento_las_palmas/core/constants/app_colors.dart';
import 'package:momento_las_palmas/onboarding/presentation/widgets/buttons/tab_button.dart';

class ThirdTab extends StatelessWidget {
  final VoidCallback onNext;

  ThirdTab({
    required this.onNext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Features Overview',
              style: TextStyle(
                color: AppColors.colorWhitePrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 18),
            const Text(
              '✔ Smart Location Finder – Find places based on your selected time.',
              style: TextStyle(
                color: AppColors.colorWhitePrimary,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              '✔ Interactive Map – View and navigate locations easily.',
              style: TextStyle(
                color: AppColors.colorWhitePrimary,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              '✔ City Culture Blog – Learn about Las Palmas.',
              style: TextStyle(
                color: AppColors.colorWhitePrimary,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              '✔ Saved Places – Keep track of your favorite spots.',
              style: TextStyle(
                color: AppColors.colorWhitePrimary,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              '✔ Location Randomizer – Get a random place suggestion.',
              style: TextStyle(
                color: AppColors.colorWhitePrimary,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            TabButton(
              onTap: onNext,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
}

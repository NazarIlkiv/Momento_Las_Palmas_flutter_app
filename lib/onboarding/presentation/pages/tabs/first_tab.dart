import 'package:flutter/material.dart';
import 'package:momento_las_palmas/core/constants/app_colors.dart';
import 'package:momento_las_palmas/onboarding/presentation/widgets/buttons/tab_button.dart';

class FirstTab extends StatelessWidget {
  final VoidCallback onNext;

  FirstTab({
    required this.onNext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 70,
          horizontal: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Discover Las Palmas at the perfect moment!',
              style: TextStyle(
                color: AppColors.colorWhitePrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 18),
            const Text(
              'Find the best places in the city based on the time of day and your vibe.',
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

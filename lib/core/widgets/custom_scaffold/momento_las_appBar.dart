import 'package:flutter/material.dart';
import 'package:momento_las_palmas/core/constants/app_colors.dart';

class MomentoLasAppBar extends StatelessWidget {
const MomentoLasAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context)=> AppBar(
  elevation: 0,
  backgroundColor: const Color(0xFF3F3F3F),
  toolbarHeight: 170,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(32),
      bottomRight: Radius.circular(32),
    ),
  ),
  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(1),
    child: Container(
      height: 1,
      color: const Color(0xFFBF9A30),
    ),
  ),
  flexibleSpace: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF1B1B1B),
            border: Border.all(color: const Color(0xFF4F4F4F), width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.colorWhitePrimary),
            onPressed: () {
            },
          ),
        ),
        const SizedBox(width: 20),
        Image.asset(
          'assets/images/splash_icons/item.png',
          width: 100,
        ),
        const SizedBox(width: 20),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF1B1B1B),
            border: Border.all(color: const Color(0xFF4F4F4F), width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_forward, color: AppColors.colorWhitePrimary),
            onPressed: () {
            },
          ),
        ),
      ],
    ),
  ),
);
}
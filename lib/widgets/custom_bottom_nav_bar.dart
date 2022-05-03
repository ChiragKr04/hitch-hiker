import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/constants/constant_colors.dart';
import 'package:hitch_hiker_app/providers/global_providers.dart';

class CustomBottomBar extends ConsumerWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget _itemBuilder(String text, IconData icon, int idx) {
      int currentIndex = ref.watch(bottomNavProvider).currentIndex;
      bool isThisSelected = currentIndex == idx;
      return GestureDetector(
        onTap: () {
          ref.read(bottomNavProvider).setCurrentIndex(idx);
        },
        child: isThisSelected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: ConstantColors.orange,
                      fontSize: 18,
                    ),
                  ),
                  const Icon(
                    Icons.circle,
                    size: 5,
                    color: ConstantColors.orange,
                  ),
                ],
              )
            : Icon(
                icon,
                color: ConstantColors.white.withOpacity(0.8),
              ),
      );
    }

    return SizedBox(
      height: 60,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: ConstantColors.navbarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _itemBuilder(
                "Create Event",
                Icons.my_library_books_outlined,
                0,
              ),
            ),
            Expanded(
              child: _itemBuilder(
                "Home",
                Icons.home_work_outlined,
                1,
              ),
            ),
            Expanded(
              child: _itemBuilder(
                "Tent Story",
                Icons.store_mall_directory_outlined,
                2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

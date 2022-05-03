import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/constants/constant_colors.dart';
import 'package:hitch_hiker_app/providers/global_providers.dart';

class EventSorterBar extends ConsumerWidget {
  const EventSorterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget _textBuilder(
      String text,
      int idx,
    ) {
      int sorterIdx = ref.watch(eventSorterProvider).eventSorter;
      bool isThisSelected = sorterIdx == idx;
      return Expanded(
        child: Material(
          elevation: isThisSelected ? 5 : 0,
          color: isThisSelected
              ? ConstantColors.highlighColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          child: GestureDetector(
            onTap: () {
              ref.read(eventSorterProvider).eventSorter = idx;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                  color: isThisSelected
                      ? ConstantColors.white
                      : ConstantColors.white.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _textBuilder("Latest", 0),
        _textBuilder("Soon", 1),
        _textBuilder("Nearest", 2),
      ],
    );
  }
}

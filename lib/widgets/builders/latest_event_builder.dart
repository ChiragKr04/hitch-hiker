import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/widgets/event_card.dart';

class LatestEventBuilder extends ConsumerWidget {
  const LatestEventBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: ListView.builder(
        controller: ScrollController(),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return EventCard(
            idx: index,
          );
        },
      ),
    );
  }
}

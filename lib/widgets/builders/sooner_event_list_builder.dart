import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hitch_hiker_app/widgets/sooner_event_card.dart';

class SoonerEventBuilder extends StatelessWidget {
  const SoonerEventBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return const SoonerEventCard();
        },
      ),
    );
  }
}

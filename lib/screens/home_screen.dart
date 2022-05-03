import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/constants/constant_colors.dart';
import 'package:hitch_hiker_app/providers/global_providers.dart';
import 'package:hitch_hiker_app/widgets/builders/sooner_event_list_builder.dart';
import 'package:hitch_hiker_app/widgets/custom_bottom_nav_bar.dart';
import 'package:hitch_hiker_app/widgets/custom_textfield.dart';
import 'package:hitch_hiker_app/widgets/event_sorter_bar.dart';
import 'package:hitch_hiker_app/widgets/logo_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const CustomTextfield(
                hintText: "Search about hiking and outdoor acts",
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 150,
                child: SoonerEventBuilder(),
              ),
              const SizedBox(height: 10),
              const EventSorterBar(),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, _) {
                  return ref.watch(eventSorterProvider).currentPage;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

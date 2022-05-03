import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/constants/constant_colors.dart';
import 'package:hitch_hiker_app/providers/global_providers.dart';
import 'package:hitch_hiker_app/screens/home_screen.dart';
import 'package:hitch_hiker_app/widgets/custom_bottom_nav_bar.dart';
import 'package:hitch_hiker_app/widgets/logo_text.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hitch Hiker",
      home: MainScreen(),
    );
  }
}

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ConstantColors.backgroundColor,
                ConstantColors.darkBackgroundColor,
              ],
              stops: [
                0,
                0.6
              ]),
        ),
        child: Scaffold(
          bottomNavigationBar: const CustomBottomBar(),
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: ConstantColors.white,
                      ),
                    ),
                    const Expanded(
                      child: LogoText(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                        color: ConstantColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: ref.watch(bottomNavProvider).currentPage,
        ),
      ),
    );
  }
}

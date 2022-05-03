import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TentStoryScreen extends ConsumerWidget {
  const TentStoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox(
      child: Text(
        "tent screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
    );
  }
}

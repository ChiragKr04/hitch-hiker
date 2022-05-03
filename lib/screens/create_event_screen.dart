import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateEventScreen extends ConsumerWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox(
      child: Text(
        "event screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
    );
  }
}

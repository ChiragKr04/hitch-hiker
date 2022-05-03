import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoonEventBuilder extends ConsumerWidget {
  const SoonEventBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text("soon"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NearestEventBuilder extends ConsumerWidget {
  const NearestEventBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text("Nearest"),
    );
  }
}

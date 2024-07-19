import 'package:fall_detection/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      verticalSpace(40),
      const Text('kareem'),
    ]));
  }
}

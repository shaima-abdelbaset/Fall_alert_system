import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/spacing.dart';

class editProfileColumn extends StatelessWidget {
  const editProfileColumn({
    super.key, required this.text, this.icon, required this.Controller,
  });
final String text;
final IconData? icon;
final TextEditingController? Controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(

        prefixIcon: Icon(icon),
        hintText: text,

    ),
      controller: Controller,
      
    );
  }
}

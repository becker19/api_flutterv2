import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final Widget? subtitle;
  final Function()? onTap;

  const CardCustom(
      {super.key, this.title, this.leading, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: leading,
              title: title,
              subtitle: subtitle,
            ),
          ],
        ),
      ),
      onTap: () => onTap!(),
    );
  }
}

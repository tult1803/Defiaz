import 'package:flutter/material.dart';

class NamedIcon extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback? onTap;
  bool? isCheck;
  NamedIcon({
    this.isCheck,
    this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(iconData),
            isCheck == true ? Positioned(
              top: 10,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                alignment: Alignment.center,
              ),
            ): Container()
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MPCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MPCustomAppBar(
      {super.key,
      this.isShowBackArrow= false,
      this.leadingIcon,
      this.leadingOnPressed, this.title, this.actions});

  final bool isShowBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final Widget? title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: isShowBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions:actions
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

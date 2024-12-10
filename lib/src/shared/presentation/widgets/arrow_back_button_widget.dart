import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ArrowBackButtonWidget extends StatelessWidget {
  final Function()? callback;
  final Color? iconColor;

  const ArrowBackButtonWidget({Key? key, this.callback, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        onPressed: () {
          // GoRouter.of(context).routerDelegate.currentConfiguration.matches.toList() ;
          callback?.call();
          context.maybePop();

          },
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_back,
          color: iconColor ?? Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BoxTile extends StatelessWidget {
  final bool? dense;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final BorderRadius? radius;
  final Color? color;
  final List<Widget>? children;
  final bool expanded;
  final bool isThreeLine;
  final Key? dismissKey;
  final DismissDirection dismissDirection;
  final Widget? background;
  final Widget? secondaryBackground;
  final ConfirmDismissCallback? confirmDissmiss;
  final DismissDirectionCallback? onDismissed;

  final GestureTapCallback? onTap;

  const BoxTile({
    Key? key,
    this.dense,
    this.margin,
    this.padding,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.radius,
    this.color,
    this.onTap,
    this.children,
    this.expanded = false,
    this.isThreeLine = false,
    this.dismissKey,
    this.dismissDirection = DismissDirection.horizontal,
    this.background,
    this.secondaryBackground,
    this.confirmDissmiss,
    this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget? leading = this.leading;
    if (leading is Icon) {
      var space = ((48 - (leading.size ?? 24)) * 0.5);
      if (space > 0) {
        leading = Padding(
          padding: EdgeInsets.symmetric(vertical: (subtitle != null ? space : 0), horizontal: space),
          child: leading,
        );
      }
    }

    Widget tile = (children?.isNotEmpty == true
        ? ExpansionTile(
            initiallyExpanded: expanded,
            tilePadding: padding,
            leading: leading,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            children: children!,
          )
        : ListTile(
            dense: dense,
            tileColor: (color ?? theme.colorScheme.surface),
            contentPadding: padding,
            leading: leading,
            title: title,
            subtitle: subtitle,
            isThreeLine: isThreeLine,
            trailing: trailing,
            onTap: onTap,
          ));

    if (dismissKey != null) {
      tile = Dismissible(
        direction: dismissDirection,
        key: dismissKey!,
        background: background,
        secondaryBackground: secondaryBackground,
        child: tile,
        confirmDismiss: confirmDissmiss,
        onDismissed: onDismissed,
      );
    }

    tile = Material(
      borderRadius: (radius ?? BorderRadius.circular(8)),
      color: (color ?? theme.colorScheme.surface),
      clipBehavior: Clip.hardEdge,
      child: tile,
    );

    if (margin != null) {
      tile = Padding(
        padding: (margin ?? EdgeInsets.zero),
        child: tile,
      );
    }

    return (children?.isNotEmpty == true
        ? Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: tile,
          )
        : tile);
  }
}

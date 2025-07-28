import 'package:flutter/material.dart';
import 'package:stackedproject/ui/common/app_colors.dart';

import '../ui_helpers.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final Widget? subtitleWidget;
  final String? description;
  final Widget? descriptionWidget;

  final Widget? suffix;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? border;
  final VoidCallback? onTap;

  const CustomCard({
    Key? key,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(16),
    this.border,
    this.onTap,
    this.suffix,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.subtitleWidget,
    this.description,
    this.descriptionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildPrefix() {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleWidget ??
                (title != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          horizontalSpaceSmall,
                        ],
                      )
                    : const SizedBox.shrink()),
            subtitleWidget ??
                (subtitle != null
                    ? Text(
                        subtitle!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : const SizedBox.shrink()),
            verticalSpaceTiny,
            const Divider(thickness: 1),
            verticalSpaceMidSmall,
            descriptionWidget ??
                (description != null
                    ? Text(
                        description!,
                        style: const TextStyle(fontSize: 14),
                      )
                    : const SizedBox.shrink()),
          ],
        ),
      );
    }

    return Card(
      color: backgroundColor ?? white,
      shape: border ??
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: grayLight, width: 1)),
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: padding!,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildPrefix(),
              suffix ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

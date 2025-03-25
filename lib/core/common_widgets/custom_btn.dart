import 'package:deals_on_map/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Color? bgColor;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final double? radius;
  final Widget? child;
  final Function()? onPressed;

  const CustomBtn({
    super.key,
    this.text,
    this.child,
    this.bgColor,
    this.textStyle,
    this.onPressed,
    this.height,
    this.radius,
    this.width,
    this.border,
    this.padding,
  }) : assert(
          text != null || child != null,
          'Either text or child must be provided',
        );

  @override
  Widget build(BuildContext context) {
    // Store the decoration properties in variables
    final effectivePadding = padding ?? EdgeInsets.symmetric(horizontal: 10);
    final effectiveBgColor = bgColor ?? headingColor;
    final effectiveBorderRadius = radius ?? 10.0;
    final effectiveHeight = height ?? 50.0;
    final effectiveWidth = width ?? double.infinity;
    final effectiveBorder = border;

    // Store the textStyle and child
    final effectiveTextStyle = textStyle ??
        TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        );
    final effectiveText = text;
    final effectiveChild = child;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: effectiveHeight,
          maxWidth: effectiveWidth,
        ),
        padding: effectivePadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          color: effectiveBgColor,
          border: effectiveBorder,
        ),
        alignment: Alignment.center,
        child: Center(
          child: effectiveChild ??
              Text(
                effectiveText!,
                style: effectiveTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
        ),
      ),
    );
  }
}

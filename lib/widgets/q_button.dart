import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QButton extends StatelessWidget {
  ///Creates a button
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Gradient? gradient;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? text;
  final TextStyle? textStyle;

  const QButton._({
    this.buttonColor,
    this.borderColor,
    this.width,
    required this.onPressed,
    this.height,
    this.borderRadius,
    this.gradient,
    this.leadingIcon,
    this.text,
    this.textStyle,
    this.trailingIcon,
  }) : assert(leadingIcon != null || text != null);

  ///Creates a customizable button with icon only
  factory QButton.icon({
    required Widget icon,
    required Function()? onPressed,
    Color? buttonColor,
    Color? borderColor,
    double? borderRadius,
    double? width,
    double? height,
    Gradient? gradient,
  }) {
    return QButton._(
      onPressed: onPressed,
      leadingIcon: icon,
      buttonColor: buttonColor,
      borderColor: borderColor,
      borderRadius: borderRadius,
      width: width,
      height: height,
      gradient: gradient,
    );
  }

  ///Creates a customizable button which has only text
  factory QButton.text({
    required String text,
    required Function()? onPressed,
    Color? buttonColor,
    Color? borderColor,
    double? borderRadius,
    TextStyle? textStyle,
    double? width,
    double? height,
    Gradient? gradient,
  }) {
    return QButton._(
      text: text,
      onPressed: onPressed,
      width: width,
      height: height,
      borderColor: borderColor,
      buttonColor: buttonColor,
      borderRadius: borderRadius,
      textStyle: textStyle,
      gradient: gradient,
    );
  }

  ///Creates a customizable button with text and leading icon
  factory QButton.textWithLeadingIcon({
    required Widget leadingIcon,
    required String text,
    required Function()? onPressed,
    Color? buttonColor,
    Color? borderColor,
    double? borderRadius,
    TextStyle? textStyle,
    double? width,
    double? height,
    Gradient? gradient,
  }) {
    return QButton._(
      onPressed: onPressed,
      leadingIcon: leadingIcon,
      text: text,
      textStyle: textStyle,
      width: width,
      height: height,
      borderColor: borderColor,
      buttonColor: buttonColor,
      borderRadius: borderRadius,
      gradient: gradient,
    );
  }

  ///Creates a customizable button with text and leading and trailing icons
  factory QButton.textWithLeadingAndTrailingIcon({
    required Widget leadingIcon,
    required String text,
    required Widget trailingIcon,
    required Function()? onPressed,
    Color? buttonColor,
    Color? borderColor,
    double? borderRadius,
    TextStyle? textStyle,
    double? width,
    double? height,
    Gradient? gradient,
  }) {
    return QButton._(
      onPressed: onPressed,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      text: text,
      textStyle: textStyle,
      width: width,
      height: height,
      borderColor: borderColor,
      buttonColor: buttonColor,
      borderRadius: borderRadius,
      gradient: gradient,
    );
  }

  @override
  Widget build(BuildContext context) {
    const initialBorderRadius = 30.0;
    return Opacity(
      opacity: onPressed != null ? 1 : 0.3,
      child: InkWell(
        borderRadius:
            BorderRadius.circular(borderRadius ?? initialBorderRadius),
        onTap: onPressed,
        child: Ink(
          height: height ?? 56,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? initialBorderRadius),
            ),
            gradient: onPressed != null
                ? gradient
                : LinearGradient(
                    colors: [
                      Colors.grey.shade300,
                      Colors.grey.shade300,
                    ],
                  ),
            color: onPressed != null ? buttonColor : Colors.grey.shade400,
            border: Border.all(
                color: onPressed != null
                    ? borderColor ?? Colors.transparent
                    : Colors.transparent),
          ),
          child: ColorFiltered(
            colorFilter: onPressed != null
                ? const ColorFilter.mode(Colors.transparent, BlendMode.color)
                : ColorFilter.mode(Colors.grey.shade300, BlendMode.overlay),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon == null)
                  const SizedBox(
                    width: 18,
                  ),
                if (leadingIcon != null)
                  Padding(
                    padding: text != null
                        ? const EdgeInsets.only(left: 27)
                        : const EdgeInsets.symmetric(horizontal: 19),
                    child: leadingIcon,
                  ),
                if (text != null)
                  Flexible(
                    child: Padding(
                      padding: trailingIcon != null
                          ? const EdgeInsets.symmetric(horizontal: 11)
                          : const EdgeInsets.only(right: 27, left: 11),
                      child: AutoSizeText(
                        text!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: onPressed != null
                            ? textStyle
                            : TextStyle(color: Colors.grey.shade900),
                      ),
                    ),
                  ),
                if (trailingIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 27),
                    child: trailingIcon,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

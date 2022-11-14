import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QButton extends StatelessWidget {
  ///Creates a button
  final Function()? onPressed;
  final Function()? onDoubleTap;
  final Function()? onLongPress;
  final Function()? onTapCancel;
  final Function(bool)? onHover;
  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? disabledColor;
  final Color? splashColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Gradient? gradient;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? text;
  final TextStyle? textStyle;
  final bool? isEnabled;

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
    this.isEnabled,
    this.disabledColor,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapCancel,
    this.onHover,
    this.onTapDown,
    this.onTapUp,
    this.splashColor,
  }) : assert(leadingIcon != null || text != null);

  ///Creates a customizable button with icon only
  factory QButton.icon({
    required Widget icon,
    required Function()? onPressed,
    Function()? onDoubleTap,
    Function()? onLongPress,
    Function()? onTapCancel,
    Function(bool)? onHover,
    Function(TapDownDetails)? onTapDown,
    Function(TapUpDetails)? onTapUp,
    Color? buttonColor,
    Color? borderColor,
    Color? splashColor,
    double? borderRadius,
    double? width,
    double? height,
    Gradient? gradient,
    bool? isEnabled,
    Color? disabledColor,
  }) {
    return QButton._(
      onPressed: onPressed,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapCancel: onTapCancel,
      onHover: onHover,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      leadingIcon: icon,
      buttonColor: buttonColor,
      borderColor: borderColor,
      splashColor: splashColor,
      borderRadius: borderRadius,
      width: width,
      height: height,
      gradient: gradient,
      isEnabled: isEnabled,
      disabledColor: disabledColor,
    );
  }

  ///Creates a customizable button which has only text
  factory QButton.text({
    required String text,
    required Function()? onPressed,
    Function()? onDoubleTap,
    Function()? onLongPress,
    Function()? onTapCancel,
    Function(bool)? onHover,
    Function(TapDownDetails)? onTapDown,
    Function(TapUpDetails)? onTapUp,
    Color? buttonColor,
    Color? borderColor,
    Color? splashColor,
    double? borderRadius,
    TextStyle? textStyle,
    double? width,
    double? height,
    Gradient? gradient,
    bool? isEnabled,
    Color? disabledColor,
  }) {
    return QButton._(
      text: text,
      onPressed: onPressed,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapCancel: onTapCancel,
      onHover: onHover,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      width: width,
      height: height,
      borderColor: borderColor,
      buttonColor: buttonColor,
      splashColor: splashColor,
      borderRadius: borderRadius,
      textStyle: textStyle,
      gradient: gradient,
      isEnabled: isEnabled,
      disabledColor: disabledColor,
    );
  }

  ///Creates a customizable button with text and leading icon
  factory QButton.textWithLeadingIcon({
    required Widget leadingIcon,
    required String text,
    required Function()? onPressed,
    Function()? onDoubleTap,
    Function()? onLongPress,
    Function()? onTapCancel,
    Function(bool)? onHover,
    Function(TapDownDetails)? onTapDown,
    Function(TapUpDetails)? onTapUp,
    Color? buttonColor,
    Color? borderColor,
    Color? splashColor,
    double? borderRadius,
    TextStyle? textStyle,
    double? width,
    double? height,
    Gradient? gradient,
    bool? isEnabled,
    Color? disabledColor,
  }) {
    return QButton._(
      onPressed: onPressed,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapCancel: onTapCancel,
      onHover: onHover,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      leadingIcon: leadingIcon,
      text: text,
      textStyle: textStyle,
      width: width,
      height: height,
      borderColor: borderColor,
      buttonColor: buttonColor,
      splashColor: splashColor,
      borderRadius: borderRadius,
      gradient: gradient,
      isEnabled: isEnabled,
      disabledColor: disabledColor,
    );
  }

  ///Creates a customizable button with text and leading and trailing icons
  factory QButton.textWithLeadingAndTrailingIcon({
    required Widget leadingIcon,
    required String text,
    required Widget trailingIcon,
    required Function()? onPressed,
    Function()? onDoubleTap,
    Function()? onLongPress,
    Function()? onTapCancel,
    Function(bool)? onHover,
    Function(TapDownDetails)? onTapDown,
    Function(TapUpDetails)? onTapUp,
    Color? buttonColor,
    Color? borderColor,
    Color? splashColor,
    double? borderRadius,
    TextStyle? textStyle,
    double? width,
    double? height,
    Gradient? gradient,
    bool? isEnabled,
    Color? disabledColor,
  }) {
    return QButton._(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onTapCancel: onTapCancel,
      onHover: onHover,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      text: text,
      textStyle: textStyle,
      width: width,
      height: height,
      borderColor: borderColor,
      buttonColor: buttonColor,
      splashColor: splashColor,
      borderRadius: borderRadius,
      gradient: gradient,
      isEnabled: isEnabled,
      disabledColor: disabledColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    const initialBorderRadius = 30.0;
    return Opacity(
      opacity: onPressed != null && (isEnabled ?? true) ? 1 : 0.3,
      child: InkWell(
        splashColor: splashColor,
        borderRadius:
            BorderRadius.circular(borderRadius ?? initialBorderRadius),
        onTap: isEnabled ?? true ? onPressed : null,
        onDoubleTap: isEnabled ?? true ? onDoubleTap : null,
        onLongPress: isEnabled ?? true ? onLongPress : null,
        onTapCancel: onTapCancel,
        onHover: onHover,
        onTapDown: isEnabled ?? true ? onTapDown : null,
        onTapUp: isEnabled ?? true ? onTapUp : null,
        child: Ink(
          height: height ?? 56,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? initialBorderRadius),
            ),
            gradient: onPressed != null && (isEnabled ?? true)
                ? gradient
                : LinearGradient(
                    colors: [
                      disabledColor ?? Colors.grey.shade300,
                      disabledColor ?? Colors.grey.shade300,
                    ],
                  ),
            color: onPressed != null && (isEnabled ?? true)
                ? buttonColor
                : disabledColor ?? Colors.grey.shade400,
            border: Border.all(
                color: onPressed != null
                    ? borderColor ?? Colors.transparent
                    : Colors.transparent),
          ),
          child: ColorFiltered(
            colorFilter: onPressed != null && (isEnabled ?? true)
                ? const ColorFilter.mode(Colors.transparent, BlendMode.color)
                : ColorFilter.mode(
                    disabledColor ?? Colors.grey.shade300, BlendMode.overlay),
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

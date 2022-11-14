import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? focusBorderColor;
  final Color? unfocusBorderColor;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final Function(String)? onChanged;
  final bool? enabled;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? label;
  final String? Function(String?)? validator;
  final GlobalKey<FormState>? formKey;
  final String? obscuringCharacter;
  final FocusNode? focusNode;
  final bool? autocorrect;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final Brightness? keyboardAppearance;
  final String? initialValue;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final Iterable<String>? autofillHints;
  final Color? cursorColor;
  final bool? hasSuffixIcon;

  ///Creates a customizable text field
  ///
  ///If some parameters like focusfocusBorderColor are not specified, the widget will take the decoration from the Theme
  const QTextField({
    Key? key,
    this.width,
    this.height,
    this.focusBorderColor,
    this.controller,
    this.labelStyle,
    this.onChanged,
    this.enabled,
    this.suffixIcon,
    this.obscureText,
    this.label,
    this.validator,
    this.formKey,
    this.obscuringCharacter,
    this.focusNode,
    this.autocorrect,
    this.onEditingComplete,
    this.onTap,
    this.readOnly,
    this.keyboardType,
    this.keyboardAppearance,
    this.initialValue,
    this.textStyle,
    this.textAlign,
    this.textCapitalization,
    this.autofillHints,
    this.cursorColor,
    this.unfocusBorderColor,
    this.hasSuffixIcon,
  }) : super(key: key);

  factory QTextField.email({
    GlobalKey<FormState>? formKey,
    TextEditingController? controller,
    bool? obscureText,
    Widget? label,
    Widget? suffixIcon,
    Color? focusBorderColor,
    Color? unfocusBorderColor,
    bool? enabled,
    String? obscuringCharacter,
    String? errorText,
    FocusNode? focusNode,
    bool? autocorrect,
    Function()? onEditingComplete,
    Function(String)? onChanged,
    Function()? onTap,
    bool? readOnly,
    TextInputType? keyboardType,
    Brightness? keyboardAppearance,
    String? initialValue,
    TextStyle? textStyle,
    TextAlign? textAlign,
    TextCapitalization? textCapitalization,
    Iterable<String>? autofillHints,
    Color? cursorColor,
    String? Function(String?)? validator,
    bool? hasSuffixIcon,
  }) {
    return QTextField(
      formKey: formKey,
      obscureText: obscureText,
      label: label ?? const Text('Email'),
      focusBorderColor: focusBorderColor,
      unfocusBorderColor: unfocusBorderColor,
      enabled: enabled,
      suffixIcon: suffixIcon,
      controller: controller,
      obscuringCharacter: obscuringCharacter,
      focusNode: focusNode,
      autocorrect: autocorrect,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      keyboardAppearance: keyboardAppearance,
      initialValue: initialValue,
      textStyle: textStyle,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      autofillHints: autofillHints,
      cursorColor: cursorColor,
      hasSuffixIcon: hasSuffixIcon,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            String p =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

            final regExp = RegExp(p);
            if (!regExp.hasMatch(value!)) {
              return 'Please enter a valid e-mail address';
            }
            return null;
          },
    );
  }

  ///Use this constructor for creating password fields.
  ///
  ///Obscuring text is set to true and cannot be changed,
  ///suffixIcon is only an icon at the start, but can be any widget
  factory QTextField.password({
    GlobalKey<FormState>? formKey,
    TextEditingController? controller,
    Widget? label,
    Widget? suffixIcon,
    Color? focusBorderColor,
    Color? unfocusBorderColor,
    bool? enabled,
    String? obscuringCharacter,
    String? errorText,
    FocusNode? focusNode,
    bool? autocorrect,
    Function()? onEditingComplete,
    Function(String)? onChanged,
    Function()? onTap,
    bool? readOnly,
    TextInputType? keyboardType,
    Brightness? keyboardAppearance,
    String? initialValue,
    TextStyle? textStyle,
    TextAlign? textAlign,
    TextCapitalization? textCapitalization,
    Iterable<String>? autofillHints,
    Color? cursorColor,
    bool? hasSuffixIcon,
    String? Function(String?)? validator,
  }) {
    return QTextField(
      formKey: formKey,
      obscureText: true,
      label: label ?? const Text('Password'),
      focusBorderColor: focusBorderColor,
      unfocusBorderColor: unfocusBorderColor,
      enabled: enabled,
      suffixIcon: suffixIcon ?? const Icon(Icons.remove_red_eye),
      controller: controller,
      obscuringCharacter: obscuringCharacter,
      focusNode: focusNode,
      autocorrect: autocorrect,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      keyboardAppearance: keyboardAppearance,
      initialValue: initialValue,
      textStyle: textStyle,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      autofillHints: autofillHints,
      cursorColor: cursorColor,
      hasSuffixIcon: hasSuffixIcon,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            if (value != null) {
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
            }
            return null;
          },
    );
  }

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  Color? color;
  final _focusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    setState(() {
      _errorText = null;
      if (widget.focusNode != null) {
        if (widget.focusNode!.hasFocus) {
          color = (widget.focusBorderColor ?? Theme.of(context).primaryColor);
        }
      } else if (_focusNode.hasFocus) {
        color = (widget.focusBorderColor ?? Theme.of(context).primaryColor);
      } else {
        color = Colors.grey.shade400;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _addListenerToFocusNodes(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: widget.width ?? 318,
            height: widget.height ?? 56,
            decoration: BoxDecoration(
              border: Border.all(color: _checkfocusBorderColor(context)),
              borderRadius: BorderRadius.circular(10),
              color: widget.enabled ?? true
                  ? Colors.transparent
                  : Colors.grey.shade300,
            ),
            margin: const EdgeInsets.only(bottom: 2),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextFormField(
                cursorColor:
                    widget.cursorColor ?? _checkfocusBorderColor(context),
                controller: widget.controller,
                onChanged: widget.onChanged,
                focusNode: widget.focusNode ?? _focusNode,
                obscureText: widget.obscureText ?? false,
                enabled: widget.enabled ?? true,
                obscuringCharacter: widget.obscuringCharacter ?? '*',
                autocorrect: widget.autocorrect ?? false,
                autofillHints: widget.autofillHints,
                onEditingComplete: widget.onEditingComplete,
                onTap: widget.onTap,
                readOnly: widget.readOnly ?? false,
                initialValue: widget.initialValue,
                keyboardType: widget.keyboardType,
                keyboardAppearance: widget.keyboardAppearance,
                style: widget.textStyle,
                textAlign: widget.textAlign ?? TextAlign.start,
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.none,
                validator: widget.enabled ?? true
                    ? (value) {
                        setState(
                            () => _errorText = widget.validator?.call(value));
                        return null;
                      }
                    : null,
                decoration: InputDecoration(
                  label: widget.label,
                  suffixIcon: widget.hasSuffixIcon ?? true
                      ? widget.suffixIcon
                      : const SizedBox(),
                  labelStyle: TextStyle(
                      color: _hasError
                          ? Colors.red
                          : widget.focusNode?.hasFocus ?? _focusNode.hasFocus
                              ? widget.focusBorderColor ?? color
                              : widget.unfocusBorderColor ??
                                  Colors.grey.shade600),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          if (_hasError) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    _errorText!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }

  void _addListenerToFocusNodes(BuildContext context) {
    widget.focusNode?.addListener(() {
      setState(() => color = (widget.focusNode!.hasFocus)
          ? (widget.focusBorderColor ?? Theme.of(context).primaryColor)
          : Colors.grey.shade400);
    });

    _focusNode.addListener(() {
      setState(() => color = (_focusNode.hasFocus)
          ? (widget.focusBorderColor ?? Theme.of(context).primaryColor)
          : Colors.red);
    });
  }

  bool get _hasError => _errorText != null;

  Color _checkfocusBorderColor(BuildContext context) {
    if (_hasError) {
      return Colors.red;
    }
    if (widget.focusNode?.hasFocus ?? _focusNode.hasFocus) {
      return widget.focusBorderColor ?? Theme.of(context).primaryColor;
    }
    if (widget.enabled != null) {
      widget.enabled ?? true ? Colors.transparent : Colors.grey.shade400;
    }

    return widget.unfocusBorderColor ?? Colors.grey.shade400;
  }
}

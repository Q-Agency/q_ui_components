import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? borderColor;
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
  final bool? autocorrext;
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

  ///Creates a customizable text field
  ///
  ///If some parameters like borderColor are not specified, the widget will take the decoration from the Theme
  const QTextField({
    Key? key,
    this.width,
    this.height,
    this.borderColor,
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
    this.autocorrext,
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
  }) : super(key: key);

  ///Use this constructor for creating password fields.
  ///
  ///Obscuring text is set to true and cannot be changed,
  ///suffixIcon is only an icon at the start, but can be any widget
  factory QTextField.password({
    GlobalKey<FormState>? formKey,
    TextEditingController? controller,
    Widget? label,
    Widget? suffixIcon,
    Color? borderColor,
    bool? enabled,
    String? obscuringCharacter,
    String? errorText,
    FocusNode? focusNode,
    bool? autocorrext,
    Function()? onEditingComplete,
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
  }) {
    return QTextField(
      formKey: formKey,
      obscureText: true,
      label: label,
      borderColor: borderColor,
      enabled: enabled,
      suffixIcon: suffixIcon ?? const Icon(Icons.remove_red_eye),
      controller: controller,
      obscuringCharacter: obscuringCharacter,
      focusNode: focusNode,
      autocorrext: autocorrext,
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
          color = (widget.borderColor ?? Theme.of(context).primaryColor);
        }
      } else if (_focusNode.hasFocus) {
        color = (widget.borderColor ?? Theme.of(context).primaryColor);
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
              border: Border.all(color: _checkBorderColor(context)),
              borderRadius: BorderRadius.circular(10),
              color: widget.enabled ?? true
                  ? Colors.transparent
                  : Colors.grey.shade300,
            ),
            margin: const EdgeInsets.only(bottom: 2),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextFormField(
                cursorColor: widget.cursorColor ?? _checkBorderColor(context),
                controller: widget.controller,
                focusNode: widget.focusNode ?? _focusNode,
                obscureText: widget.obscureText ?? false,
                enabled: widget.enabled ?? true,
                obscuringCharacter: widget.obscuringCharacter ?? '*',
                autocorrect: widget.autocorrext ?? false,
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
                  labelStyle: TextStyle(
                      color: _hasError
                          ? Colors.red
                          : widget.focusNode?.hasFocus ?? _focusNode.hasFocus
                              ? widget.borderColor ?? color
                              : Colors.grey.shade600),
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
          ? (widget.borderColor ?? Theme.of(context).primaryColor)
          : Colors.grey.shade400);
    });

    _focusNode.addListener(() {
      setState(() => color = (_focusNode.hasFocus)
          ? (widget.borderColor ?? Theme.of(context).primaryColor)
          : Colors.grey.shade400);
    });
  }

  bool get _hasError => _errorText != null;

  Color _checkBorderColor(BuildContext context) {
    if (_hasError) {
      return Colors.red;
    }
    if (widget.focusNode?.hasFocus ?? _focusNode.hasFocus) {
      return widget.borderColor ?? Theme.of(context).primaryColor;
    }
    if (widget.enabled != null) {
      widget.enabled ?? true ? Colors.transparent : Colors.grey.shade400;
    }

    return Colors.grey.shade400;
  }
}

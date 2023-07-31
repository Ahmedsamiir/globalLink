import 'package:flutter/material.dart';


class FormInputField extends StatefulWidget {
  final String title;
  final String? hint;
  final TextInputType? textInputType;
  final void Function(String?)? onSave;
  final Function? onDoneTapped;
  final String? Function(String?) ?validator;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool isRequired;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool obscureText;
  final Color fillColor;
  final String? initialValue;
  final int minLines;
  final int maxLines;
  final double cornerRadius;
  final bool readOnly;
  final bool enabled;
  final double elevation;
  final  ValueChanged<String>?  onChanged;
  final InputBorder? border;
  final InputBorder errorBorder;
  final EdgeInsets? contentPadding;




  const FormInputField({
    Key? key,
    required this.title,
    this.hint,
    this.textInputType,
    this.onSave,
    this.onDoneTapped,
    this.hintStyle,
    this.validator,
    this.textEditingController,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.isRequired = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.labelStyle,
    this.fillColor = const Color(0xFFF3F6F9),
    this.initialValue,
    this.minLines = 1,
    this.maxLines = 1,
    this.cornerRadius = 5,
    this.elevation = 0.0,
    this.readOnly = false,
    this.border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Color(0xFFE8E8EB),
          width: 1,
        )),
    this.errorBorder = const OutlineInputBorder(borderSide: BorderSide(color: Color(0x99F44336))),
    this.enabled = true,
    this.contentPadding, this.onChanged, required errorStyle,
  }) : super(key: key);

  @override
  _FormInputFieldState createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(widget.cornerRadius),
      elevation: widget.elevation,
      //shadowColor: Colors.black.withOpacity(0.3),
      child: TextFormField(
        onChanged: widget.onChanged,
        enabled: widget.enabled,
        cursorColor: Colors.black,
        key: Key(widget.title),
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        initialValue: widget.initialValue,
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType ?? TextInputType.text,
        validator: widget.validator ??
                (value) {
              if (widget.isRequired) {
                if (value!.isEmpty) {
                  return 'invalid';
                }
                return null;
              } else {
                return null;
              }
            },
        onSaved: widget.onSave,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        style: widget.style ?? const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
        textInputAction: widget.textInputAction ?? (widget.nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
        onEditingComplete: () {
          if (widget.focusNode != null) widget.focusNode?.unfocus();
          if (widget.onDoneTapped != null) widget.onDoneTapped!().call();
        },
        onFieldSubmitted: (term) {
          if (widget.focusNode != null) widget.focusNode?.unfocus();
          if (widget.nextFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        },
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: Colors.white,
            labelText: widget.title,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            labelStyle: widget.labelStyle ?? TextStyle(color: Colors.grey.withOpacity(0.4), fontWeight: FontWeight.w500, fontSize: 14),
            contentPadding: widget.contentPadding,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(color: Color(0xFFBDD7FF)),
            ),

            // focusedBorder: widget.border,
            enabledBorder: widget.border,
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: Color(0xFFE8E8EB),
                  width: 1,
                )),
            errorBorder: widget.errorBorder,
            focusedErrorBorder: widget.border,
            hintText: widget.hint,
            hintStyle: widget.hintStyle ?? TextStyle(color: Color(0xFFA8A8A8))),
      ),
    );
  }
}

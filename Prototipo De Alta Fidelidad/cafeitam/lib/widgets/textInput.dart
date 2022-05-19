import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText, hintText, helperText, initialText;
  final Function(String?)? onSaved, onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;
  final int? maxLines, maxLength;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextInput(
      {Key? key,
      this.controller,
      this.labelText,
      this.hintText,
      this.helperText,
      this.initialText,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.keyboardType,
      this.isPassword = false,
      this.suffixIcon,
      this.maxLength,
      this.maxLines,
      this.inputFormatters})
      : super(key: key);

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      onSaved: widget.onSaved,
      validator: widget.validator,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      initialValue: widget.initialText,
      maxLength: widget.maxLength,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
              )
            : widget.suffixIcon != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 8),
                      Icon(
                        widget.suffixIcon,
                        size: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ],
                  )
                : null,
        //border: OutlineInputBorder(),
        labelText: widget.labelText,
        helperText: widget.helperText,
      ),
    );
  }
}

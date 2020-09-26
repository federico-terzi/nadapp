import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FocusTextFormField extends StatefulWidget {
  final String initialValue;
  final TextInputType keyboardType;
  final String labelText;
  final int minLines;
  final int maxLines;

  final void Function(String) onUnfocused;
  final void Function(String) onSaved;
  final String Function(String) validator;


  FocusTextFormField({this.initialValue = "", this.keyboardType = TextInputType
      .text, this.labelText, this.onSaved,
    this.onUnfocused, this.validator, this.minLines, this.maxLines});

  @override
  _FocusTextFormFieldState createState() => _FocusTextFormFieldState();
}

class _FocusTextFormFieldState extends State<FocusTextFormField> {
  final controller = TextEditingController();

  bool focused = false;
  String errorText;

  @override
  void initState() {
    controller.text = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus)
        {
          if (!focus) {
            String errorText = widget.validator(controller.text);

            setState(() {
              this.errorText = errorText;
            });

            if (errorText == null) {
              widget.onUnfocused?.call(controller.text);
            }
          }
          focused = focus;
        },
        child: TextFormField(
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          controller: controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              errorText: errorText,
              labelText: widget.labelText),
          validator: widget.validator,
          onTap: () {
            if (!focused) {
              controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
            }
          },
          onChanged: (String newValue) {
            if (newValue
                .trim()
                .isEmpty) {
              return;
            }

            setState(() {
              errorText = widget.validator(newValue);
            });
          },
          onSaved: widget.onSaved,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
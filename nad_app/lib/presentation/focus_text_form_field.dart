import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nad_app/utils/debouncer.dart';

class FocusTextFormField extends StatefulWidget {
  final String initialValue;
  final TextInputType keyboardType;
  final String labelText;
  final int minLines;
  final int maxLines;

  final void Function(String) onEditingEnded;
  final void Function(String) onSaved;
  final String Function(String) validator;


  FocusTextFormField({this.initialValue = "", this.keyboardType = TextInputType
      .text, this.labelText, this.onSaved,
    this.onEditingEnded, this.validator, this.minLines, this.maxLines});

  @override
  _FocusTextFormFieldState createState() => _FocusTextFormFieldState();
}

class _FocusTextFormFieldState extends State<FocusTextFormField> {
  final controller = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 1000);

  bool focused = false;
  String errorText;

  @override
  void initState() {
    controller.text = widget.initialValue;
    super.initState();
  }

  @override
  void dispose() {
    _debouncer?.cancel();
    controller.dispose();
    super.dispose();
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
              widget.onEditingEnded?.call(controller.text);
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

            // When text field changes, trigger the event
            _debouncer.run(() => widget.onEditingEnded(newValue));
          },
          onSaved: widget.onSaved,
        ),
      ),
    );
  }
}
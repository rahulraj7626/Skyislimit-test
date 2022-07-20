import 'package:flutter/material.dart';

///Costum textfield
class TextFieldWidget extends StatefulWidget {
  final String hint;

  final TextEditingController controller;

  final String errMsg;

  const TextFieldWidget(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.errMsg})
      : super(key: key);
  static const txtStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorMaxLines: 2,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 0,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.0,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: widget.hint,
          fillColor: Colors.black12,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return widget.errMsg;
          }

          return null;
        },
      ),
    );
  }
}

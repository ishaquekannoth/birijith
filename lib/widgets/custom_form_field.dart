import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  const CustomFormField(
      {this.padding = const EdgeInsets.all(1),
      this.controller,
      this.hintText = "",
      super.key,
      this.icon = Icons.numbers});
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: padding,
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(8),
            FilteringTextInputFormatter.allow(
                RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$'))
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(
                icon,
                color: Colors.deepPurple,
              ),
              hintText: hintText,
              errorStyle: const TextStyle(color: Colors.blue),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid, color: Colors.deepPurple)),
              contentPadding:
                  EdgeInsets.only(left: 0, top: 0, bottom: height * 0.02),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)))),
          validator: (value) {
            if (value == '' || value == null) {
              return "$hintText Cant be empty";
            } else {
              return null;
            }
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/extensions/num_extension.dart';
import 'package:secure_access_administrator/core/widgets/custom_text_field.dart';

class QueryWidget extends StatelessWidget {
  const QueryWidget({
    super.key,
    required this.caption,
    required this.controller,
    required this.hint,
    required this.label,
    required this.onChange});

  final String caption;
  final String hint;
  final String label;
  final Function(String) onChange;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
    width: 400,
    child: Column(
      children: [
        Text(label),
        10.height,
        CustomTextField(
          width: 400,
          onChanged: (value)=> onChange(value),
          controller: controller, labelText: label,
        )


      ],
    )
    );
  }
}
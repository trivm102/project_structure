import 'package:flutter/material.dart';
import 'package:project_structure/consts/constants.dart';
import 'package:project_structure/core/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {

  const RoundedInputField({ Key? key, this.hintText, this.icon, required this.onTextChanged }) : super(key: key);

  final String? hintText;
  final IconData? icon;
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon, color: 
            kPrimaryColor), 
          hintText: hintText, 
          hintStyle: const TextStyle(fontFamily: 'OpenSans'),
          border: const OutlineInputBorder()),
          onChanged: (value) => {
            onTextChanged(value)
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
          },
      )
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_budgeting_app/components/colors.dart';

class MyTextField extends StatelessWidget {
  var controller, label, hintText, type, suffixIcon;
  MyTextField(
      {super.key,
        required this.controller,
        required this.label,
        required this.hintText,
        this.type = TextInputType.text,
        this.suffixIcon,
      });
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal:28, vertical:5),
        child: SizedBox(
          height: 70,
          child: TextFormField(
            cursorColor: Colors.lightBlue,
            keyboardType: type,
            controller: controller,
            decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                helperText: ' ',
                hintStyle: TextStyle(fontFamily: 'sans', color:titleColor.withOpacity(0.7)),
                labelText: label,
                labelStyle:
                const TextStyle(color: Colors.black54, fontFamily: 'sans'),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue))),
            validator: (value) {
              if (value!.isEmpty) {
                return hintText;
              }
              return null;
            },
          ),
        ),
      );
  }
}

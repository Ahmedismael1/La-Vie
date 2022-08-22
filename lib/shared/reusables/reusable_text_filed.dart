import 'package:flutter/material.dart';
class ReusableTextFiled extends StatelessWidget {
  ReusableTextFiled({ this.onChange,this.prefixIcon,this.textInputType,this.textController,this.validator,this.hintText}) ;
  Icon prefixIcon;
  String hintText;
  Function onChange,validator;
  TextInputType textInputType;
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      onChanged: onChange
      ,keyboardType: textInputType,
      decoration: InputDecoration(
hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xff1abc00),
              width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Color(0xff1abc00)




      ),
      validator:validator ,

    );
  }
}

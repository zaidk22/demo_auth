import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.hintText,
      this.inputFormatters,
      this.validator,
      this.onChange,
      this.Icons,
      this.onIconTap,
      required this.textStyle1,
      this.isObscureText,
      this.controller})
      : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(
    String?,
  )? validator;
  final void Function(String?)? onChange;
  final IconData? Icons;
  final TextStyle textStyle1;
  final VoidCallback? onIconTap;
  final bool? isObscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText ?? false,
        style: textStyle1,
        inputFormatters: inputFormatters,
        validator: (inputString) {
          return validator?.call(inputString);
        },
        decoration: InputDecoration(
          //hintText: hintText,
          //  label: Text(hintText),

          hintStyle: textStyle1,
          // labelStyle: textStyle1,
//  prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.red) : null,
          suffixIcon: Icons != null
              ? IconButton(
                  onPressed: onIconTap, icon: Icon(Icons), color: Colors.red)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}

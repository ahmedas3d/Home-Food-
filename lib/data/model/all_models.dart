import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/constant/color.dart';


class CustomFormAuth extends StatelessWidget {
  final String hinttext;
  final String label;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool isNamber;
  final bool? obscureText;
  final void Function()? onTap;
  final void Function()? onTapFull;
  final Color? color;

  const CustomFormAuth({
    Key? key,
    required this.hinttext,
    required this.label,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNamber,
    this.obscureText,
    this.onTap,
    this.onTapFull,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTapFull,
      style: const TextStyle(color: Colors.black),
      keyboardType: isNamber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      controller: mycontroller,
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
        fillColor: color ?? Colors.black12,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        labelStyle: const TextStyle(
            color: Colors.redAccent, fontSize: 14, fontWeight: FontWeight.bold),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(label)),
        prefixIcon: Icon(
          iconData,
          color: AppColor.mainColor.withOpacity(0.5),
        ),
        suffixIcon: obscureText != null
            ? InkWell(onTap: onTap, child: Icon(iconData))
            : null,
      ),
    );
  }
}

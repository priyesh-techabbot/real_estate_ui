import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:real_estate_ui/utils/color_res.dart';
import 'package:real_estate_ui/utils/style.dart';

class ModernHintTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onTap;
  final String hintText;
  final bool obscureText;
  final bool autoFocus;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final bool readOnly;
  final bool enabled;

  const ModernHintTextField({
    required this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    required this.hintText,
    this.obscureText = false,
    this.autoFocus = false,
    this.enabled = true,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      onTapOutside: (event) => Get.focusScope?.unfocus(),
      style: Style.textStyle(),
      validator: validator,
      onTap: onTap,
      autofocus: autoFocus,
      enabled: enabled,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Style.textStyle(
          color: ColorRes.lightGrey,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor:
            fillColor ?? (enabled ? ColorRes.white : ColorRes.backgroundColor),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorRes.primaryColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorRes.primaryColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorRes.errorColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorRes.primaryColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorRes.errorColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorRes.grey,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignLabelWithHint: true,
        errorMaxLines: 3,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

class ModernLabelTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final bool autoFocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool enabled;
  final Color? fillColor;
  final int? maxLines;
  final int? minLine;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onFieldSubmitted;

  const ModernLabelTextField({
    required this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    required this.labelText,
    this.obscureText = false,
    this.autoFocus = false,
    this.enabled = true,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLine,
    this.maxLength,
    this.autovalidateMode,
    this.hintText,
    this.onFieldSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      onTapOutside: (event) => Get.focusScope?.unfocus(),
      style: Style.textStyle(),
      validator: validator,
      autofocus: autoFocus,
      maxLength: maxLength,
      minLines: minLine,
      maxLines: maxLines,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Style.textStyle(
          color: ColorRes.grey,
        ),
        hintText: hintText,
        hintStyle: Style.textStyle(
          color: ColorRes.lightGrey,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor:
            fillColor ?? (enabled ? ColorRes.white : ColorRes.backgroundColor),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorRes.primaryColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorRes.primaryColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorRes.errorColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorRes.primaryColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorRes.errorColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorRes.grey,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignLabelWithHint: true,
        errorMaxLines: 3,
      ),
      onChanged: onChanged,
    );
  }
}

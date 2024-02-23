import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maazoon/shared/constants.dart';

Widget CustomTextField({
  required TextEditingController controller,
  required String title,
  Widget? icon,
  TextInputType? keyboard,
  String? Function(String? st)? validator,
  List<TextInputFormatter>? format,
  bool obscure = false,
  String? preText,
  Widget? suffix,
  String? hint,
  bool floatLabel = false,
  Color? color,
}) =>
    TextFormField(
      keyboardType: keyboard,
      controller: controller,
      validator: validator,
      inputFormatters: format,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: title,
        contentPadding: const EdgeInsets.all(18),
        labelStyle: const TextStyle(),
        prefixIcon: icon,
        prefixText: preText,
        suffixIcon: suffix,
        hintText: hint,
        floatingLabelBehavior: floatLabel
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: color ?? AppColors.borderGrey,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: color ?? AppColors.borderGrey,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: color ?? AppColors.borderGrey,
            width: 1,
      ),),)
    );

Widget AppScaffold({
  required BuildContext context,
  required Widget body,
  Widget? title,
  List<Widget>? actions,
  bool scrollable = true,
}) =>
    title !=null
        ? Scaffold(
            backgroundColor: AppColors.primaryGreen,
            appBar: AppBar(
              title: title,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios)),
              actions: actions,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primaryGreen,
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: AppColors.white),
              height: screenHeight(context),
              child: scrollable? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: body,
                ),
              ):body,
            ),
          )
        : Scaffold(
            body: body,
          );

Widget AppElevatedButton({
  required BuildContext context,
  required void Function() onPressed,
  required String title,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: const Color(0xffC8B05E),
        padding: const EdgeInsets.all(16),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth(context) / 22.5,
          ),
        ),
      ),
    );

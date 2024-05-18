import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labeText;
  final bool isPass;
  final IconData icon;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labeText,
    required this.icon,
    this.isPass = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPass ? isSecure : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          label: Text(widget.labeText),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          prefixIcon: Icon(widget.icon),
          suffix: widget.isPass
              ? IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                  icon: Icon(isSecure ? Iconsax.eye : Iconsax.eye_slash),
                )
              : null,
        ),
      ),
    );
  }
}

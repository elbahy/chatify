import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPass;
  final IconData icon;
  final TextInputType keyboardType;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.isPass = false,
    required this.keyboardType,
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
            label: Text(widget.labelText),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            prefixIcon: Icon(widget.icon),
            suffix: widget.isPass
                ? GestureDetector(
                    onTap: () => setState(() => isSecure = !isSecure),
                    child: Icon(
                      isSecure ? Iconsax.eye : Iconsax.eye_slash,
                    ),
                  )
                : null),
        validator: (value) {
          if (widget.labelText == 'Email') {
            const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
            final regex = RegExp(pattern);

            return value!.isEmpty || !regex.hasMatch(value) ? 'Enter a valid email address' : null;
          } else {
            return value!.isEmpty || value.length < 6 ? '${widget.labelText} is less than 6 characters' : null;
          }
        },
        keyboardType: widget.keyboardType,
      ),
    );
  }
}

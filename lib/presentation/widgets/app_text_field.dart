import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AppTextField extends StatelessWidget {

  final String? label;
  final Color labelTextColor;
  final String hintText;
  final String? helperText;
  final IconData? prefixIconData;
  final bool isEnabled;
  final void Function(String value) onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.label,
    this.labelTextColor = Colors.grey,
    required this.hintText,
    this.helperText,
    this.prefixIconData,
    this.isEnabled = true,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.name,
    this.textCapitalization = TextCapitalization.sentences,
    this.controller,
    this.inputFormatters
  });

  @override
  Widget build(BuildContext context) {
    double inputHeight = 70;
    inputHeight += helperText != null ? 20 : 0;
    inputHeight += label != null ? 20 : 1;

    return SizedBox(
      height: inputHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(label != null) Text(
            label!,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: labelTextColor
            ),
          ),
          Container(
            height: 54,
            padding: EdgeInsets.only(top: label != null ? 10 : 0),
            child: TextField(
              enabled: isEnabled,
              onChanged: onChanged,
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              textCapitalization: textCapitalization,
              inputFormatters: inputFormatters,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFFB1B5BB)
                ),
                fillColor: isEnabled ? Colors.white : const Color(0xffC8D0D9),
                filled: true,
                prefixIcon: prefixIconData != null
                  ? Icon(
                    prefixIconData!,
                    color: Colors.grey,
                    size: 22,
                  )
                  : null,
                contentPadding: EdgeInsets.only(
                  top: 5,
                  left: prefixIconData != null ? 0 : 10,
                  right: 10
                )
              ),
            ),
          ),
          if(helperText != null) ...[
            const SizedBox(height: 4),
            Text(
              helperText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey
              ),
            )
          ],
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}

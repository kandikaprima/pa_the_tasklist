import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
    {Key? key,
    required this.title,
    required this.hint,
    this.isSecure = false,
    required this.controller,
    this.maxLines = 1
    }) : super(key: key);

  final String title, hint;
  final bool isSecure;
  final TextEditingController controller;
  final int maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool secureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 10,),
        widget.isSecure
          ? TextField(
            controller: widget.controller,
            obscureText: secureText,
            decoration: InputDecoration(
              hintText: widget.hint,
              suffixIcon: GestureDetector(
                onTap: () {
                  if (secureText == false) {
                    setState(() {
                      secureText = true;
                    });
                  } else {
                    setState(() {
                      secureText = false;
                    });
                  }
                  setState(() {});
                },
                child: secureText
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              ),
              hintStyle: TextStyle(fontSize: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            )
          : TextField(
              controller: widget.controller,
              obscureText: widget.isSecure,
              maxLines: widget.maxLines,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
      ],
    );
  }
}
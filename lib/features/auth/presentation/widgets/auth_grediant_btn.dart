import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/theme/color_schemes.g.dart';

class AuthGradientButton extends StatelessWidget {
  final String labelText;
  final VoidCallback pressed;
  const AuthGradientButton({super.key, required this.labelText, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          lightColorScheme.secondary,
          lightColorScheme.tertiary,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft
        ),
        borderRadius: BorderRadius.circular(14)
      ),
      child: ElevatedButton(

        onPressed: pressed,
        child: Text(labelText, style: TextStyle(
          color: Colors.lightGreen
        ),),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent
        ),
      ),
    );
  }
}

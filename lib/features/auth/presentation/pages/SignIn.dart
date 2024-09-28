import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_arch/core/theme/color_schemes.g.dart';
import 'package:flutter_clean_arch/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter_clean_arch/features/auth/presentation/widgets/auth_grediant_btn.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          child : Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign In.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50
                    ),),
                  const SizedBox(height: 30,),
                  AuthField(hintText: "Email", controller: emailController,),
                  const SizedBox(height: 15,),
                  AuthField(hintText: "password", controller: passwordController, isPassword: true,),
                  const SizedBox(height: 15,),
                  AuthGradientButton(labelText: 'login'
                  , pressed: () {

                  },),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account',
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
                            children: [
                              TextSpan(
                                  text: ' Sign Up',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: lightColorScheme.primary,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ]
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}


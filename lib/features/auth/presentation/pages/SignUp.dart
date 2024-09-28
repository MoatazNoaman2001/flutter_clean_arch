import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/theme/color_schemes.g.dart';
import 'package:flutter_clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_clean_arch/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter_clean_arch/features/auth/presentation/widgets/auth_grediant_btn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController.addListener(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.of(context).pushNamed('/sign_in');
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
                  }
                },
                builder: (context, state) {
                  if (State is AuthLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign up.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 50),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AuthField(
                            hintText: "name",
                            controller: nameController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AuthField(
                            hintText: "Email",
                            controller: emailController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AuthField(
                            hintText: "password",
                            controller: passwordController,
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AuthGradientButton(
                            labelText: 'Sign up',
                            pressed: () {
                              if (formKey.currentState!.validate()) {
                                Fluttertoast.showToast(
                                  msg: "signing up"
                                );
                                context.read<AuthBloc>().add(
                                      SignUp(
                                        nameController.text.trim(),
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                      ),
                                    );
                              }else{
                                Fluttertoast.showToast(
                                    msg: "error"
                                );
                              }
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/sign_in');
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: 'Have an account',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    children: [
                                  TextSpan(
                                      text: ' Sign In',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: lightColorScheme.primary,
                                              fontWeight: FontWeight.bold))
                                ])),
                          )
                        ],
                      ),
                    ),
                  );
                },
            ),
          ),
        ));
  }
}

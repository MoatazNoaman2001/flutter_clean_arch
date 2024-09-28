import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/secrets/app_secrets.dart';
import 'package:flutter_clean_arch/features/auth/data/auth_remote_db.dart';
import 'package:flutter_clean_arch/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/user_sign_in.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_clean_arch/features/auth/presentation/pages/SignIn.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/color_schemes.g.dart';
import 'features/auth/presentation/pages/SignUp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnonKey);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => AuthBloc(
                signUp: UserSignUp(AuthRepositoryImpl(
                    AuthRemoteDataStoreImpl(supabase.client))),
                signIn: UserSignIn(AuthRepositoryImpl(
                  AuthRemoteDataStoreImpl(supabase.client)
                ))
              ))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "home",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/sign_up',
      routes: {
        '/sign_up': (context) => SignUpPage(),
        '/sign_in': (context) => SignInPage()
      },
    );
  }
}

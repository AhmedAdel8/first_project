import 'package:first_project/core/extensions/navigation_extension.dart';
import 'package:first_project/core/utils/log_util.dart';
import 'package:first_project/features/auth/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final loginCubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmailController(controller: loginCubit.emailController),
            const SizedBox(height: 16),
            PasswordController(controller: loginCubit.passwordController),
            const SizedBox(height: 24),
            BlocListener<AuthCubit, AuthState>(
              listenWhen: (previous, current) => current is LoginSuccess,
              listener: (context, state) {
                if (state is LoginSuccess) {
                  logSuccess('Success');
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  final email = loginCubit.emailController.text;
                  final password = loginCubit.passwordController.text;
                  print('Email: $email, Password: $password');

                  context.read<AuthCubit>().userLogin(
                    email: email,
                    password: password,
                  );
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class EmailController extends StatelessWidget {
  final TextEditingController controller;

  const EmailController({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class PasswordController extends StatefulWidget {
  final TextEditingController controller;

  const PasswordController({super.key, required this.controller});

  @override
  State<PasswordController> createState() => _PasswordControllerState();
}

class _PasswordControllerState extends State<PasswordController> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      obscureText: _obscureText,
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/components/reusable_text.dart';
import 'package:task_manager_app/core/components/reusable_text_field.dart';
import 'package:task_manager_app/core/components/reusable_button_widget.dart';
import 'package:task_manager_app/presentation/cubit/auth/auth_cubit.dart';

import '../../core/components/reusable_snackbar.dart';
import '../../core/constants/path_constants.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              reusableText(
                text: 'Login',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                margin: const EdgeInsets.only(bottom: 16.0),
              ),
              const SizedBox(height: 48.0),
              ReusableTextField(
                hintText: 'Username',
                icon: Icons.person,
                keyboardType: TextInputType.name,
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ReusableTextField(
                hintText: 'Password',
                obscureText: true,
                icon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    showReusableSnackBar(context, state.message);
                  } else if (state is AuthSuccess) {
                    debugPrint(
                        'Login Successful login_view ${state.authEntity.toString()}');
                    context
                        .read<AuthCubit>()
                        .saveCurrentUser(user: state.authEntity);
                    context.go(PathConstants.todoView);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return reusableButtonWidget(
                    buttonName: 'Login',
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        final username = usernameController.text;
                        final password = passwordController.text;
                        context.read<AuthCubit>().login(
                              username: username,
                              password: password,
                            );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

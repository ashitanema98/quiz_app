// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/drivers/repo_shared_pref.dart';
import 'package:quiz_app/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:quiz_app/presentation/bloc/login_bloc/login_event.dart';
import 'package:quiz_app/presentation/bloc/login_bloc/login_state.dart';
import 'package:quiz_app/presentation/pages/home_screen.dart';
import 'package:quiz_app/presentation/pages/registeration_screen.dart';
import 'package:quiz_app/presentation/widgets/custom_appbar.dart';
import 'package:quiz_app/presentation/widgets/login_widgets/error_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static navigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: const LoginScreen(),
                )));
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarTitle: 'Quiz App'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    "Email",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      // labelText: 'Email',
                      hintText: 'Enter Your Email',
                      prefixIcon: const Align(
                        widthFactor: 1.0,
                        child: Icon(
                          Icons.alternate_email,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    onChanged: (value) {
                      BlocProvider.of<LoginBloc>(context).add(
                          LoginTextChangedEvent(
                              _emailController.text, _passwordController.text));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    "Password",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      // labelText: 'Password',
                      hintText: 'Enter Your Password',
                      prefixIcon: const Align(
                        widthFactor: 1.0,
                        child: Icon(
                          Icons.password,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    onChanged: (value) {
                      BlocProvider.of<LoginBloc>(context).add(
                          LoginTextChangedEvent(
                              _emailController.text, _passwordController.text));
                    },
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => SignUpScreen()),
                      // );
                    },
                    child: const Text.rich(
                        textAlign: TextAlign.end,
                        TextSpan(
                          text: "Forgot Password?? ",
                          style:
                              TextStyle(fontSize: 20, color: Colors.redAccent),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                    return SizedBox(
                      height: 60,
                      width: 250,
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.login_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        label:
                            const Text('Login', style: TextStyle(fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo.shade400,
                            elevation: 20,
                            shape: const StadiumBorder()),
                        onPressed: () async {
                          if (state is LoginValidState) {
                            if (await Auth.login(_emailController.text,
                                _passwordController.text)) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  LoginSubmittedEvent(_emailController.text,
                                      _passwordController.text));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            }
                          } else {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginInvalidEvent(_emailController.text,
                                    _passwordController.text));
                          }
                        },
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                    if (state is LoginErrorState) {
                      return ErrorContainer(data: state.errorMessage);
                    } else {
                      return Container();
                    }
                  }),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterationScreen()),
                      );
                    },
                    child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: "Don't have an Account?? ",
                            style: TextStyle(fontSize: 20),
                            children: [
                              TextSpan(
                                  text: 'SignUp',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.indigo.shade400))
                            ])),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

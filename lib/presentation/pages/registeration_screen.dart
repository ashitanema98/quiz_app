// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:quiz_app/presentation/pages/login_screen.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.contact_support_outlined),
        title: const Text('Quiz App'),
      ),
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
                      // BlocProvider.of<LoginBloc>(context).add(
                      //     LoginTextChangedEvent(
                      //         _emailController.text, _passwordController.text));
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
                      // BlocProvider.of<LoginBloc>(context).add(
                      //     LoginTextChangedEvent(
                      //         _emailController.text, _passwordController.text));
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    "Confirm Password",
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
                      // BlocProvider.of<LoginBloc>(context).add(
                      //     LoginTextChangedEvent(
                      //         _emailController.text, _passwordController.text));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  // return
                  SizedBox(
                    height: 60,
                    width: 250,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.login_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: const Text('Register',
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                          elevation: 20, shape: const StadiumBorder()),
                      onPressed: () {
                        // if (state is LoginValidState) {
                        //   BlocProvider.of<LoginBloc>(context).add(
                        //       LoginSubmittedEvent(_emailController.text,
                        //           _passwordController.text));
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => HomeScreen()));
                        // }
                      },
                    ),
                    // );
                    // }
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  //   if (state is LoginErrorState) {
                  //     return Text(
                  //       state.errorMessage,
                  //       style: TextStyle(color: Colors.red),
                  //     );
                  //   } else {
                  //     return Container();
                  //   }
                  // }),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => LoginBloc(),
                                    child: const LoginScreen(),
                                  )));
                    },
                    child: const Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: "Already have an Account?? ",
                            style: TextStyle(fontSize: 20),
                            children: [
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.blue))
                            ])),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

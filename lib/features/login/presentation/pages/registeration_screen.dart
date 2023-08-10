import 'package:flutter/material.dart';
import 'package:quiz_app/features/login/presentation/pages/login_screen.dart';
import 'package:quiz_app/features/login/presentation/widgets/custom_appbar.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarTitle: 'Quiz App'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
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
                    onChanged: (value) {},
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
                    onChanged: (value) {},
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
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                          backgroundColor: Colors.indigo.shade400,
                          elevation: 20,
                          shape: const StadiumBorder()),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      LoginScreen.navigate(context);
                    },
                    child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: "Already have an Account?? ",
                            style: const TextStyle(fontSize: 20),
                            children: [
                              TextSpan(
                                  text: 'Login',
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

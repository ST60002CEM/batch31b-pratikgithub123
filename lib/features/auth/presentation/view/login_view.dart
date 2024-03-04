import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/core/common/snackbar/my_snackbar.dart';
import 'package:fruit_ordering_app/core/routes/app_router.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view/register_view.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view_model/auth_viewmodel.dart';

class MyLogin extends ConsumerStatefulWidget {
  const MyLogin({super.key});

  @override
  ConsumerState<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends ConsumerState<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: "user@gmail.com");
  final _passwordController = TextEditingController(text: "user123");
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authState.showMessage! && authState.error != null) {
        if (authState.error == 'Invalid credentials') {
          showSnackBar(message: 'Invalid Credentials', context: context);
        } else if (authState.error == null) {
          // Login success, show a "Login Success" Snackbar
          showSnackBar(message: 'Login Success', context: context);
        } else {
          // Show a generic error message for other errors
          showSnackBar(message: 'An error occurred', context: context);
        }
        ref.read(authViewModelProvider.notifier).resetMessage(false);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 80,
                              child: Icon(
                                Icons.lock,
                                size: 130,
                                color: Colors.black,
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Welcome Back \n         Please Login in!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      key: ValueKey('Email'),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        } else if (!value.contains('@')) {
                          return '@ is missing in email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await ref
                                .read(authViewModelProvider.notifier)
                                .loginUser(context, _usernameController.text,
                                    _passwordController.text);

                            Navigator.pushNamed(context, AppRoute.homeRoute);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black, // Set the text color
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 30.0), // Set the button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Set the button border radius
                          ),
                        ),
                        child: const Text(
                          'Sign In ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyRegister()));
                        },
                        child: const Text(
                          "Don't have an account ? SignUp",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

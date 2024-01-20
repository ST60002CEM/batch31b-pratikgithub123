import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/core/common/snackbar/my_snackbar.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view/register_view.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view_model/auth_viewmodel.dart';

class MyLogin extends ConsumerStatefulWidget {
  const MyLogin({super.key});

  @override
  ConsumerState<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends ConsumerState<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _gap = const SizedBox(height: 8);
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authState.showMessage! && authState.error != null) {
        showSnackBar(message: 'Invalid Credentials', context: context);
        ref.read(authViewModelProvider.notifier).resetMessage(false);
      }
    });
    return Container(
      decoration: const BoxDecoration(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 54, 212, 244),
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 73, 192, 215),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Login\nTo Your \n Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextFormField(
                            key: const ValueKey('username'),
                            controller: _usernameController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                          ),
                          _gap,
                          TextFormField(
                            key: const ValueKey('password'),
                            controller: _passwordController,
                            obscureText: isObscure,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await ref
                                        .read(authViewModelProvider.notifier)
                                        .loginUser(
                                            context,
                                            _usernameController.text,
                                            _passwordController.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      Colors.black, 
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0,
                                      horizontal:
                                          30.0), 
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), 
                                  ),
                                ),
                                child: const Text('Sign In '),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyRegister()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      Colors.black, // Set the text color
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0,
                                      horizontal:
                                          30.0), // Set the button padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Set the button border radius
                                  ),
                                ),
                                child: const Text('Create New Account'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password ?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

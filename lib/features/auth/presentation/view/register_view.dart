import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/core/common/provider/is_network_provided.dart';
import 'package:fruit_ordering_app/core/common/snackbar/my_snackbar.dart';
import 'package:fruit_ordering_app/features/auth/domain/entity/auth_entity.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view_model/auth_viewmodel.dart';

class MyRegister extends ConsumerStatefulWidget {
  const MyRegister({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyRegisterState();
}

class _MyRegisterState extends ConsumerState<MyRegister> {
  final _key = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _locationController = TextEditingController();
  final _phonenumController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 20);

    final isConnected = ref.watch(connectivityStatusProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.watch(authViewModelProvider).showMessage!) {
        showSnackBar(message: 'Registration success', context: context);
        ref.read(authViewModelProvider.notifier).resetMessage(false);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fullnameController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Full NAme';
                        }
                        return null;
                      }),
                    ),
                    gap,
                    TextFormField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Location',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                        return null;
                      }),
                    ),
                    gap,
                    TextFormField(
                      controller: _phonenumController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Phone Num',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phoneNo';
                        }
                        return null;
                      }),
                    ),
                    gap,
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      }),
                    ),
                    gap,
                    TextFormField(
                      controller: _passwordController,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
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
                    gap,
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            final entity = AuthEntity(
                              fullname: _fullnameController.text.trim(),
                              location: _locationController.text.trim(),
                              phonenum: _phonenumController.text.trim(),
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            // Register user
                            ref
                                .read(authViewModelProvider.notifier)
                                .registerUser(entity);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black, // Set the text color
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 10.0), // Set the button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                100.100), // Set the button border radius
                          ),
                        ),
                        child: const Text('Registerr',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

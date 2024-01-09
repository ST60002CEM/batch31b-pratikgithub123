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
  final _gap = const SizedBox(height: 8);

  final _key = GlobalKey<FormState>();
  final _fullnameController = TextEditingController(text: '');
  final _locationController = TextEditingController(text: '');
  final _phonenumController = TextEditingController(text: '');
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectivityStatusProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConnected == ConnectivityStatus.isDisconnected) {
        showSnackBar(
            message: 'No Internet Connection',
            context: context,
            color: Colors.red);
      } else if (isConnected == ConnectivityStatus.isConnected) {
        showSnackBar(
            message: 'You are online', context: context, color: Colors.red);
      }

      if (ref.watch(authViewModelProvider).showMessage!) {
        showSnackBar(
            message: 'Student Registerd Successfully', context: context);
        ref.read(authViewModelProvider.notifier).resetMessage(false);
      }
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 212, 244),
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fullnameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Full NAme';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter location';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _phonenumController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Num',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phoneNo';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
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
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          final entity = AuthEntity(
                            fullname: _fullnameController.text.trim(),
                            location: _locationController.text.trim(),
                            phonenum: _phonenumController.text.trim(),
                            username: _usernameController.text,
                            password: _passwordController.text,
                          );
                          // Register user
                          ref
                              .read(authViewModelProvider.notifier)
                              .registerUser(entity);
                        }
                      },
                      child: const Text('Registerr'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

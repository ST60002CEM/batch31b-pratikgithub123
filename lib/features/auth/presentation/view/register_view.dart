import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_ordering_app/core/common/provider/is_network_provided.dart';
import 'package:fruit_ordering_app/core/common/snackbar/my_snackbar.dart';
import 'package:fruit_ordering_app/features/auth/domain/entity/auth_entity.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view/login_view.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _key,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/fruits.png'))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Register Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person)),
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
                      prefixIcon: Icon(Icons.location_city)),
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
                      prefixIcon: Icon(Icons.phone)),
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
                      prefixIcon: Icon(Icons.email)),
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
                    prefixIcon: Icon(Icons.lock),
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
                  width: double.infinity,
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
                    child: const Text('Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                  ),
                ),
                gap,
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyLogin()));
                  },
                  child: Text(
                    'Already have an account ?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

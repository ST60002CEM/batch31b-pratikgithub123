import 'package:flutter/material.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view/register_view.dart';
import 'package:fruit_ordering_app/features/home/presentation/view/bottom_navigation/dashboard.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 54, 212, 244),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 73, 192, 215),
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
              child: Text(
                "Login TO Your Account",
                style: TextStyle(
                  height: 10,
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.only(left: 10, top: 10),
            //   height: 50,
            //   width: 50,
            //   child: Image.asset('assets/images/basket.png'),
            // ),

            Container(
              
              child: Container(
                margin: const EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      style: const TextStyle(),
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardView()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Colors.black, // Set the text color
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 30.0), // Set the button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  100.0), // Set the button border radius
                            ),
                          ),
                          child: const Text('Sign In '),
                        ),
                        ElevatedButton(
                          onPressed: () {
                           
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Colors.black, // Set the text color
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 10.0), // Set the button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  100.0), // Set the button border radius
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

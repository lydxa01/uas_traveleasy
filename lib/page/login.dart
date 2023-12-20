  import 'package:uas_traveleasy/page/homepg.dart';
  import 'package:uas_traveleasy/resources/controller.dart';
  import 'package:uas_traveleasy/tombol/profil.dart';
  import 'package:flutter/material.dart';
  import 'package:uas_traveleasy/page/regis.dart';
  import 'package:firebase_auth/firebase_auth.dart';

  class Login extends StatefulWidget {
    const Login({Key? key}) : super(key: key);

    @override
    State<Login> createState() => _LoginState();
  }

  class _LoginState extends State<Login> {
    final _auth = FirebaseAuth.instance;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    String _email = "";
    String _password = "";
    void _handleLogin() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print("User Logged in: ${userCredential.user!.email}");

      // Check if login is successful
      if (userCredential.user != null) {
        // Navigate to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    } catch (e) {
      print("Error during Login: $e");
      // Handle login failure, e.g., show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to log in. Please try again.'),
        ),
      );
    }
  }
    // bool isHidden = true;
    // final _auth = FirebaseAuth.instance;

    // void _signIn(String email, String password) async { // Add this method
    //   try {
    //     final userCredential = await _auth.signInWithEmailAndPassword(
    //       email: email,
    //       password: password,
    //     );

    //     if (userCredential.user != null) {
    //       // The user successfully logged in
    //       // Navigate to the next page
    //       Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (context) => HomePage(), // Replace with your next page
    //       ),
    //     );
    //     } else {
    //       // The user failed to log in
    //       // Show an error message
    //       ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('Failed to log in. Please try again.'),
    //       ),
    //     );
    //     }
    //   } catch (e) {
    //     // An error occurred while trying to log in
    //     // Show an error message
    //      ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('An error occurred: $e'),
    //     ),
    //   );
    //   }
    // }

    // void navigateToRegistration() {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => Regis(),
        
    //   ));
    // }

    // final _formSignInKey = GlobalKey<FormState>();
    // bool rememberPassword = true;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          onChanged: (value){
                            setState(() {
                              _email = value;
                            });
                          } ,
                          // controller: emailController,
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            hintText: 'Enter Email',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          onChanged: (value){
                            setState(() {
                              _password = value;
                            });
                          } ,
                          obscureText: true,
                          obscuringCharacter: '*',
                          // controller: passwordController,
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            hintText: 'Enter Password',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Checkbox(
                                //   // value: rememberPassword,
                                //   onChanged: (bool? value) {
                                //     setState(() {
                                //       // rememberPassword = value!;
                                //     });
                                //   },
                                //   activeColor: Colors.black87,
                                // ),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              child: Text(
                                'Forget password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _handleLogin();
                                // _register();
                              }
                            },
                            child: const Text('Login'),
                          ),
                          
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10,
                              ),
                              child: Text(
                                'Sign up with',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/fb.png',
                            width: 30),
                            Image.asset('assets/google.png',
                            width:30),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        // don't have an account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account? ',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (e) => const Regis(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  // Future<void> login() async {
  //  final auth = FirebaseAuth.instance;
  //   auth.signInWithEmailAndPassword(
  //       email:emailController.text,
  //       password: passwordController.text,
  //     );
    
  // }
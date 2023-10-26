import 'package:auto_route/auto_route.dart';
import 'package:demo_auth/dbHelper/mongoDb.dart';
import 'package:demo_auth/routes/routes.gr.dart';
import 'package:demo_auth/utils/custom_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/validartors.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool _obscureText = true;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: deviceSize.height,
          width: double.infinity,
          child: ListView(
            children: [
              SizedBox(
                height: deviceSize.height * 0.1,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "We",
                  style: GoogleFonts.pacifico(color: Colors.blue, fontSize: 30),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: GoogleFonts.ptSansNarrow(
                      color: Colors.blue, fontSize: 30),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Heyy, you'are back! ",
                  style:
                      GoogleFonts.cagliostro(color: Colors.black, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Username"),
              CustomFormField(
                hintText: "UserName",
                controller: _userNameController,
                textStyle1: GoogleFonts.abel(),
                Icons: Icons.check_rounded,
                validator: Validators.name,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Password"),
              CustomFormField(
                hintText: "Password",
                controller: _passwordController,
                isObscureText: _obscureText,
                textStyle1: GoogleFonts.abel(),
                Icons: _obscureText ? Icons.visibility : Icons.visibility_off,
                validator: Validators.password,
                onIconTap: () {
                  _togglePasswordVisibility();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text('Remember me'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.blueAccent),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () async {
                    // if (_formKey.currentState!.validate()) {
                    // AutoRouter.of(context)
                    //                   .push(const HomeRoute());
                    //           }
                    var result = await MongoDB.findUser(
                        _userNameController.text, _passwordController.text);
                    if (result.success == true) {
                      AutoRouter.of(context).push( HomeRoute(user: result?.user));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result?.message ??"")));
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,

                        height: 2, // Adjust the height of the line

                        width: deviceSize.width /
                            2, // Adjust the width of the line
                      ),
                    ),

                    const SizedBox(
                        width:
                            10), // Adjust the space between the lines and text

                    const Text(
                      'Or',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        height: 2,
                        width: deviceSize.width / 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Create Now',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            AutoRouter.of(context).push(const SignUpRoute());
                          },
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

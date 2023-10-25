import 'package:auto_route/auto_route.dart';
import 'package:demo_auth/dbHelper/mongoDb.dart';
import 'package:demo_auth/models/user.dart';
import 'package:demo_auth/routes/routes.gr.dart';
import 'package:demo_auth/utils/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import '../utils/validartors.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  bool _obscureText = true;
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
                height: deviceSize.height * 0.08,
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
                  "Create Account",
                  style: GoogleFonts.ptSansNarrow(
                      color: Colors.blue, fontSize: 30),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Let's make you official!",
                  style:
                      GoogleFonts.cagliostro(color: Colors.black, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Full name"),
              CustomFormField(
                hintText: "",
                textStyle1: GoogleFonts.abel(),
                validator: Validators.name,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Username"),
              CustomFormField(
                hintText: "UserName",
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
                  onPressed: () {
                   // if (_formKey.currentState!.validate()) {
                      // AutoRouter.of(context).push(HomeRoute());
                      _insertData();
                   // }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'By creating an account or signing you agree to our ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms and Conditions',
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _insertData() async {
    var _id = M.ObjectId();
    final data = UserModel(
        id: _id, email: 'test@123', fullName: 'test', password: '123456');
    var result = await MongoDB.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("$result")));
    print(result);
  }
}

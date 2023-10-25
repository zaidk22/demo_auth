import 'package:auto_route/auto_route.dart';
import 'package:demo_auth/utils/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
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
                style:
                    GoogleFonts.ptSansNarrow(color: Colors.blue, fontSize: 30),
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
           
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Username"),
            CustomFormField(
              hintText: "UserName",
              textStyle1: GoogleFonts.abel(),
              Icons: Icons.check_rounded,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Password"),
            CustomFormField(
              hintText: "Password",
              textStyle1: GoogleFonts.abel(),
              Icons: Icons.visibility,
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
                onPressed: () {},
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
    );
  }
}

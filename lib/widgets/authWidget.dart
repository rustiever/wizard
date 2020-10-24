import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizard/controllers/authController.dart';
import 'package:wizard/services/firebaseServices.dart';

class AuthWidget extends StatelessWidget {
  final controller = Get.put(AuthController());
  final service = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool isSignUp;
  AuthWidget({
    Key key,
    this.isSignUp = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Center(
        child: SizedBox(
          width: 500,
          child: Material(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    isSignUp ? 'Sign up with email' : 'Welcome Back',
                    style: const TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 28,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  if (isSignUp)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      child: TextFormField(
                        controller: controller.name,
                        decoration: InputDecoration(
                          labelText: "Enter Name",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Name cannot be empty";
                          } else if (!GetUtils.isUsername(val)) {
                            return 'Not valid Name';
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Email cannot be empty";
                        } else if (!GetUtils.isEmail(val)) {
                          return 'Not valid email';
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.pass,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "password cannot be empty";
                        } else if (!GetUtils.isLengthBetween(val, 8, 12)) {
                          return 'Not a valid password';
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        isSignUp
                            ? await service.createUserWithEmailAndPassword(
                                controller.email.text,
                                controller.pass.text,
                                controller.name.text)
                            : await service.signInWithEmailAndPassword(
                                controller.email.text, controller.pass.text);
                        if (Get.isDialogOpen) Get.back();
                      }
                    },
                    color: const Color(0xff4ba97d),
                    child: Text(
                      isSignUp ? 'Sign Up' : 'Sign In',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  if (isSignUp)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: Text(
                        "Click “Sign Up” to agree to Medium’s Terms of Service and acknowledge that Medium’s Privacy Policy applies to you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Helvetica Neue",
                          fontSize: 13,
                          color: Color(0xffb9b9b9),
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

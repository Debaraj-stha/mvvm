import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/roundedButton.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/authViewModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _emailController,
              focusNode: emailNode,
              onFieldSubmitted: (value) =>
                  Utils.fieldFocusChange(context, emailNode, passwordNode),
              decoration: const InputDecoration(
                suffix: Icon(Icons.email),
                label: Text("Email"),
              ),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (context, value, child) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                      obscureText: value,
                      obscuringCharacter: "*",
                      focusNode: passwordNode,
                      controller: _passwordController,
                      onFieldSubmitted: (value) => Utils.fieldFocusChange(
                          context, emailNode, passwordNode),
                      decoration: InputDecoration(
                          suffix: const Icon(Icons.lock_outline_rounded),
                          label: const Text("password"),
                          prefix: InkWell(
                            child: value
                                ? const Icon(Icons.visibility_off_rounded)
                                : const Icon(Icons.visibility),
                            onTap: () {
                              setState(() {
                                _valueNotifier.value != _valueNotifier.value;
                              });
                            },
                          ))),
                );
              }),
          RoundedButton(
              text: "Login",
              callback: () {
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  Utils.showSnackBar(context, "All fields are required");
                } else {
                  if (kDebugMode) {
                    print("submitted");
                  }
                  Map data = {
                    'email': _emailController.text,
                    'password': _passwordController.text
                  };
                  AuthViewNodel().login(data, context);
                }
              })
        ]),
      ),
    );
  }
}

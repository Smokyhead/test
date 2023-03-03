// ignore_for_file: avoid_print

import 'package:appflut/Models/state_model.dart';
import 'package:appflut/Screens/Home/main_screen.dart';
import 'package:appflut/Screens/Login/Components/background_login.dart';
import 'package:appflut/Screens/Signup/signup_screen.dart';
import 'package:appflut/Service/login_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final myController1 = TextEditingController();
  String emailVal = "";
  final myController2 = TextEditingController();
  String passwordVal = "";
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyModel>(builder: (context, model, child) {
      return Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Text(
                "Connectez vous",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: kPrimaryColor),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Votre Email",
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    )),
                controller: myController1,
              ),
            ),
            TextFieldContainer(
                child: TextFormField(
              obscureText: hidePassword,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: kPrimaryColor),
                border: InputBorder.none,
                hintText: "Votre Mot de passe",
              ),
              controller: myController2,
            )),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 5),
              width: 310,
              height: 60,
              child: TextButton(
                onPressed: () {
                  emailVal = myController1.text;
                  print("email = $emailVal");
                  passwordVal = myController2.text;
                  print("password = $passwordVal");
                  LoginAPI.loginUser(emailVal, passwordVal).then((response) {
                    if (response == true) {
                      model.email = emailVal;
                      model.password = passwordVal;
                      model.username = LoginAPI.modelVal.username;
                      print("this is ${model.email}");
                      print("this is too ${model.password}");
                      print("id is ${LoginAPI.modelVal.id}");
                      print(LoginAPI.responseModel.data!.username);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      }));
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Problème de connexion'),
                            content: const Text("Email/mot de passe invalide"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                child: const Text("CONNEXION", style: TextStyle(fontSize: 20)),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Récupérez Mot de passe',
                  style: TextStyle(color: Colors.blueGrey),
                )),
            Column(
              children: [
                Container(
                    margin: const EdgeInsetsDirectional.only(top: 20),
                    child: const Text('Vous n\'avez pas un compte?')),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignupScreen();
                    }));
                  },
                  child: const Text(
                    'Inscrivez-vous ici',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kPrimaryLightColor, borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}

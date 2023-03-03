import 'package:appflut/Screens/Login/login-screen.dart';
import 'package:appflut/Screens/Signup/signup_screen.dart';
import 'package:appflut/constants.dart';
import 'package:flutter/material.dart';
import 'background_welc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Bienvenue",
                  textScaleFactor: 4,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 5,
                      color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text(
                "Connectez-vous",
                style: TextStyle(height: 2, fontSize: 20),
              ),
              Container(
                width: 255,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  child: const Text("SE CONNECTER"),
                ),
              ),
              Container(
                width: 255,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignupScreen();
                    }));
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(kPrimaryColor),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  child: const Text(
                    "S'INSCRIRE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:appflut/Models/state_model.dart';
import 'package:appflut/Models/user_model.dart';
import 'package:appflut/Screens/Home/main_screen.dart';
import 'package:appflut/Screens/Login/login-screen.dart';
import 'package:appflut/Screens/Signup/Components/background_signup.dart';
import 'package:appflut/Service/api_service.dart';
import 'package:appflut/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  String usernameVal = "";
  String emailVal = "";
  String pwVal = "";
  String usernamecntr = "";
  String emailcntr = "";
  String pwcntr = "";
  bool hidePassword = true;
  late UserModel userModel;
  bool emailValid = true;
  late String mes;

  @override
  void initState() {
    super.initState();
    userModel = UserModel();
    emailController.addListener(() {
      setState(() {
        emailValid = _isValidEmail(emailController.text);
      });
    });
  }

  bool _isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (!emailRegExp.hasMatch(email)) {
      mes = "Email n'est pas valide";
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController dateController = TextEditingController();
    return Background(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Container(
          margin: const EdgeInsetsDirectional.only(top: 75),
          child: const Text(
            "Inscrivez vous",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: kPrimaryColor),
          ),
        ),
        TextFieldContainer(
          child: TextField(
            decoration: const InputDecoration(
                hintText: "Pseudo", border: InputBorder.none),
            controller: usernameController,
          ),
        ),
        TextFieldContainer(
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "E-mail", border: InputBorder.none),
            controller: emailController,
          ),
        ),
        // const TextFieldContainer(
        //   child: TextField(
        //     decoration:
        //         InputDecoration(hintText: "Adresse", border: InputBorder.none),
        //   ),
        // ),
        // const TextFieldContainer(
        //     child: TextField(
        //   decoration:
        //       InputDecoration(hintText: "Téléphone", border: InputBorder.none),
        // )),
        TextFieldContainer(
            child: TextField(
          obscureText: hidePassword,
          decoration: InputDecoration(
            hintText: "Mot de passe",
            border: InputBorder.none,
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
          ),
          controller: pwController,
        )),
        /*Container(
            margin: EdgeInsets.symmetric(vertical: 6),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: 315,
            height: 60,
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              controller: dateController, //editing controller of this TextField
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Date de naissance", //label text of field
                border: InputBorder.none,
              ),
              readOnly: true, // when true user cannot edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(
                        1900), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  print(
                      pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('dd-mm-yyyy').format(
                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                  print(
                      formattedDate); //formatted date output using intl package =>  2022-07-04
                  //You can format date as per your need
                  setState() {
                    dateController.text =
                        formattedDate; //set formatted date to TextField value.
                  }
    
                  ;
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ), */
        Container(
          margin: const EdgeInsetsDirectional.only(top: 5),
          width: 310,
          height: 50,
          child: TextButton(
            onPressed: () {
              setState(() {
                usernameVal = usernameController.text;
                usernamecntr = usernameController.toString();
                emailVal = emailController.text;
                emailcntr = emailController.toString();
                pwVal = pwController.text;
                pwcntr = pwController.toString();
              });
              print(usernamecntr);
              print(emailcntr);
              print(pwcntr);
              print("username = $usernameVal");
              print("email = $emailVal");
              print("pw = $pwVal");
              userModel.userName = usernameController.text;
              userModel.emailId = emailController.text;
              userModel.password = pwController.text;
              APIServices.registerUser(userModel)
                  .then((UserResponseModel response) {
                if (response.code == 200 && _isValidEmail(emailVal) == true) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                } else if (_isValidEmail(emailVal) == false) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Problème d\'inscription'),
                        content: Text(mes),
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
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Problème d\'inscription'),
                        content: Text(response.message),
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            child: const Text("INSCRIPTION", style: TextStyle(fontSize: 20)),
          ),
        ),
        Column(
          children: [
            Container(
                margin: const EdgeInsetsDirectional.only(top: 20),
                child: const Text('Avez-vous déja un compte?')),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: const Text(
                'Connectez-vous ici',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ]),
    );
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
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: 50,
      decoration: BoxDecoration(
          color: kPrimaryLightColor, borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}

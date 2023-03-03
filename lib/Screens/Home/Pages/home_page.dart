import 'package:appflut/Models/state_model.dart';
import 'package:appflut/Screens/Home/Widgets/consultation_card.dart';
import 'package:appflut/Screens/Home/Widgets/title_bar.dart';
import 'package:appflut/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

  
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                model.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 30,
                        ),
                      )
                    ]),
              ),
              const TitleBar(title: "Upcoming Consultations"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ConsultationCard(
                        color: kPrimaryLightColor,
                        name: "Andrew\nGraham",
                      ),
                      SizedBox(width: 15),
                      ConsultationCard(
                        color: kPrimaryLightColor,
                        name: "Diana\nHawkes",
                      ),
                      SizedBox(width: 15),
                      ConsultationCard(
                        color: kPrimaryLightColor,
                        name: "Harley\nMartinez",
                      ),
                    ],
                  ),
                ),
              ),
              const TitleBar(
                title: "Practitional Profiles",
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 35,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}

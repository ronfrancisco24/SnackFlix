import 'package:flutter/material.dart';
import 'package:vending_machine/screens/menu.dart';
import 'package:vending_machine/widgets/constants.dart';
import 'package:vending_machine/widgets/buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/homepage.png'),
              fit: BoxFit.cover,
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 640),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Welcome to SnackFlix - Your go-to binge-worthy snack. Explore top treats, '
                  'snack combos, and fuel up for the perfect chill night!',
                  style: kWhitePoppins.copyWith(
                      fontSize: 12, color: Colors.orange[300]),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 340,
                height: 70,
                child: RedOvalButton(
                  text: 'Buy a Snack',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

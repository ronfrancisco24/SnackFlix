import 'package:flutter/material.dart';
import 'package:vending_machine/screens/menu.dart';
import 'package:vending_machine/widgets/constants.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  double balance = 0;
  
  //TODO: has to be globalized. use a provider.
  //TODO: have the balance have a limit of 100 (check transaction page)
  //TODO: have a reset button for the balance.

  void addToBalance(double amount){
    setState(() {
      balance += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Input Money', style: kWhitePoppins),
          backgroundColor: kBlack,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: kLinearGradient,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                      children: [
                        SizedBox(height: 30),
                        Container(
                          width: 400,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: kBlueGray),
                          child: Column(
                            children: [
                              SizedBox(height: 40),
                              Text('Total Balance',
                                  style: kWhitePoppins.copyWith(
                                      fontSize: 15, color: kDarkGray)),
                              Text('₱ ${balance.toStringAsFixed(2)}',
                                  style: kWhitePoppins.copyWith(fontSize: 50)),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(//for piso
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {// Action for piso image
                                  addToBalance(1);
                                },
                                child: Image.asset('images/piso.png', width: 130),
                              ),
                              GestureDetector(
                                onTap: () {// Action for five peso
                                  addToBalance(5);
                                },
                                child: Image.asset('images/five_piso.png', width: 125),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {// 10 peso
                                  addToBalance(10);
                                },
                                child: Image.asset('images/ten_piso.png', width: 135),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {// Action for twenty image
                                  addToBalance(20);
                                },
                                child: Image.asset('images/twenty.png', width: 130),
                              ),
                              GestureDetector(
                                onTap: () {// Action for fifty image
                                  addToBalance(50);
                                },
                                child: Image.asset('images/fifty.png', width: 140),
                              ),
                              GestureDetector(
                                onTap: () {// Action for hundred image
                                  addToBalance(100);
                                },
                                child: Image.asset('images/hundred.png', width: 139),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: (){
                            setState(() {
                              balance = 0;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kDarkGray,
                            fixedSize: Size.fromWidth(350),
                          ),
                          child: Text(
                            'Refund', style: kGrayPoppins.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MenuPage())
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kLightRed,
                            fixedSize: Size.fromWidth(350),
                          ),
                          child: Text(
                            'Confirm', style: kBlackPoppins.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

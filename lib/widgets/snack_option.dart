import 'package:flutter/material.dart';
import 'package:vending_machine/widgets/constants.dart';

class SnackOption extends StatelessWidget {
  final String? productName;
  final String? label;
  final String? imagePath;
  final double? price;

  const SnackOption(
      {Key? key,
      required this.productName,
      required this.label,
      required this.imagePath,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(color: kMediumGray, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label!, style: kGrayPoppins.copyWith(fontSize: 15)),
          SizedBox(
            width: 80, // Set the desired width
            height: 50, // Set the desired height
            child: Image.asset(
              imagePath!,
              fit: BoxFit.cover, // Choose how you want the image to fit
            ),
          ),
          Text(productName!, style: kGrayPoppins.copyWith(fontSize: 10)),
          Text('₱${price!.toStringAsFixed(2)}', style: kGrayPoppins.copyWith(fontSize: 15))
        ],
      ),
    );
  }
}

//TODO: finish this..

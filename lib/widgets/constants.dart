import 'package:flutter/material.dart';

// colors

const kBlack = Color(0xFF0E131F);
const kBlue = Color(0xFF2C3F84);
const kGray = Color(0xFF91959C);
const kDarkGray = Color(0xFF181E2E);
const kMediumGray = Color(0xFF2A303F);
const kBlueGray = Color(0xFF38405F);
const kLightRed = Color(0xFFf9232c);

// gradient

const kLinearGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF0e131F), Color(0xFF38405F)]));

// fonts

const kLeagueSpartan =
    TextStyle(fontFamily: 'LeagueSpartan', fontSize: 20, color: Colors.white);

const kWhitePoppins = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28,
    color: Colors.white,
    fontWeight: FontWeight.bold);

const kBlackPoppins = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28,
    color: kBlack,
    fontWeight: FontWeight.bold);

const kGrayPoppins = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28,
    color: kGray,
    fontWeight: FontWeight.bold);


import 'package:flutter/material.dart';

const String URL = "https://razjoapi.herokuapp.com";
const HEADERS = {'Content-Type': 'application/json'};
const PSY_ROLE = "PSY";
const USER_ROLE = "USR";

// colors
const List<List<Color>> kFamButtonsColors = [
  [
    Color(0xffD93657),
    Color(0xffC61F40),
  ],
  [
    Color(0xffEE6896),
    Color(0xffEA5674),
  ],
];

const List<String> months = [
  "Stycznia",
  "Lutego",
  "Marca",
  "Kwietnia",
  "Maja",
  "Czerwca",
  "Lipca",
  "Sierpnia",
  "Września",
  "Października",
  "Listopada",
  "Grudnia",
];

const List<String> weekDays = [
  "Poniedziałek",
  "Wtorek",
  "Środa",
  "Czwartek",
  "Piątek",
  "Sobota",
  "Niedziela",
];

const BoxDecoration kGradientBg = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.white,
      Color(0xffe3e3e3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

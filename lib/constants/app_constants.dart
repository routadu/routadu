import 'package:flutter/material.dart';
import 'package:portfolio/models/project/project.dart';
import 'package:portfolio/models/tech/tech.dart';

const kContentPaddingFromLeftDouble = 140.0;

const kThemeColor = Color(0xFF3944FF);
const kBackgroundColor = Color.fromARGB(255, 12, 12, 20);

const KContentPaddingFromLeft =
    EdgeInsets.only(left: kContentPaddingFromLeftDouble);

const KHorizontalContentPadding =
    EdgeInsets.symmetric(horizontal: kContentPaddingFromLeftDouble);

const kFlutterTech = Tech(
  name: "Flutter",
  website: "https://www.flutter.dev",
  assetURL:
      "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png",
);
const kWindowsTech = Tech(
    name: "Windows",
    website: "https://www.microsoft.com/en-in/windows/",
    assetURL:
        "https://cdn.pixabay.com/photo/2018/05/08/21/29/windows-3384024_1280.png");

List<Project> projectsDummyList = [
  Project(
    title: "Portfolio Website",
    id: 1000,
    imageURL: "",
    description: "Portfolio website built using Flutter",
    technologiesUsed: [kFlutterTech, kWindowsTech],
    sourceCodeLink: "demo",
  ),
  Project(
    title: "OP Analyzer",
    id: 1001,
    imageURL: "",
    description: "A minimal Nifty Option Chain application",
    technologiesUsed: [kFlutterTech, kWindowsTech],
    sourceCodeLink: "demo",
  ),
  Project(
    title: "Bouncing Ball",
    id: 1001,
    imageURL: "",
    description:
        "A casual ball shooting game made with Flutter.\nIt is available on the Play Store",
    technologiesUsed: [kFlutterTech],
    liveDemoLink: "demo",
  ),
  Project(
    title: "Image Classifier",
    id: 1000,
    imageURL: "",
    description:
        "A machine learning based application made using Python and Flutter, which can detect over 100 kinds of objects.",
    technologiesUsed: [kFlutterTech, kFlutterTech],
    sourceCodeLink: "demo",
    liveDemoLink: "demo",
  ),
  Project(
    title: "School Manager",
    id: 1000,
    imageURL: "",
    description:
        "Feature loaded School Management app made with Python Kivy and MySQL.",
    technologiesUsed: [kFlutterTech, kFlutterTech, kFlutterTech],
    sourceCodeLink: "demo",
    liveDemoLink: "demo",
  ),
];

const String kAboutMeString =
    "A 3rd year CSE student passionate about building software products to empower people and businesses. I develop apps using Flutter and Kotlin. I have led my team in multiple projects and competitions and have been awarded Student of the Year in Computer Science in 12th grade for building a feature rich School Management Desktop app, going beyond the basic requirements.";

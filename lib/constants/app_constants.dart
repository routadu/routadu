import 'package:flutter/material.dart';
import 'package:portfolio/models/about_info_tile_data/about_info_tile_data.dart';
import 'package:portfolio/models/project/project.dart';
import 'package:portfolio/models/tech/tech.dart';

const kResumePublicLink =
    "https://drive.google.com/file/d/1tDZyKBe_ujd1ihOkQrsm-Zr5ltMlT_yv/view?usp=sharing";

const kContentPaddingFromLeftDouble = 140.0;

const kThemeColor = Color(0xFF3944FF);
const kBackgroundColor = Color.fromARGB(255, 12, 12, 20);

const KContentPaddingFromLeft =
    EdgeInsets.only(left: kContentPaddingFromLeftDouble);

const KHorizontalContentPadding =
    EdgeInsets.symmetric(horizontal: kContentPaddingFromLeftDouble);

const kAndroidTech = Tech(
  name: "Android",
  website: "https://www.android.com/",
  assetURL:
      "https://source.android.com/static/docs/setup/images/Android_symbol_green_RGB.png",
);

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
      "https://cdn.pixabay.com/photo/2018/05/08/21/29/windows-3384024_1280.png",
);

const kPythonTech = Tech(
  name: "Python",
  website: "https://www.python.org/",
  assetURL:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBn-dcd6YGUghWJb4gdr1FMJCwZsMyt2QPJg&usqp=CAU",
);

List<AboutInfoTileData> kSkillsList = [
  AboutInfoTileData(
      title: "Flutter", secondaryText: "Cross Platform App Development"),
  AboutInfoTileData(
      title: "Kotlin", secondaryText: "Native Android App Development"),
  AboutInfoTileData(title: "Java", secondaryText: "Intermediate experience"),
  AboutInfoTileData(title: "Python", secondaryText: "Intermediate experience"),
  AboutInfoTileData(title: "C++", secondaryText: "Intermediate experience"),
];

List<AboutInfoTileData> kEducationList = [
  AboutInfoTileData(
    title: "Chandigarh University",
    secondaryText: "Bachelors in Computer Science Engineering",
    tertiaryText: "CGPA: 8.25",
  ),
  AboutInfoTileData(
    title: "Kendriya Vidyalaya Andews Ganj",
    secondaryText: "Grade XII",
    tertiaryText: "Percentage: 86.6",
  ),
  AboutInfoTileData(
    title: "Kendriya Vidyalaya ARC Charbatia",
    secondaryText: "Grade X",
    tertiaryText: "Percentage: 95",
  ),
];

List<AboutInfoTileData> kCertificationList = [
  AboutInfoTileData(
    title: "Flutter Development Bootcamp with Dart",
    secondaryText: "Udemy",
  ),
  AboutInfoTileData(
    title: "Blockchain Summer Training",
    secondaryText: "Metacrafters",
  ),
];

List<Project> projectsList = [
  Project(
    title: "Portfolio Website",
    id: 1000,
    imageURL: "",
    description: "Portfolio website built using Flutter",
    technologiesUsed: [kFlutterTech],
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
    technologiesUsed: [kPythonTech, kFlutterTech],
    sourceCodeLink: "demo",
    liveDemoLink: "demo",
  ),
  Project(
    title: "School Manager",
    id: 1000,
    imageURL: "",
    description:
        "Feature loaded School Management app made with Python Kivy and MySQL.",
    technologiesUsed: [kPythonTech],
    sourceCodeLink: "demo",
    liveDemoLink: "demo",
  ),
];

const String kAboutMeString =
    "Dedicated and enthusiastic computer science student with a strong foundation in Data Structures and Algorithms. Deeply passionate about app development and have honed my skills in Flutter and Android. My work has received appreciation for delivering high-quality projects. Posses good communication and team-building skills, which enables me to foster collaborative environments for effective problem-solving. Committed to continuous learning and growth drives me to stay at the forefront of the ever-evolving field of computer science.";

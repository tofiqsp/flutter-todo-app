import 'package:todo/todo.dart';

var themeDark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xffeb06ff),
    secondary: const Color(0xff237bff),
    brightness: Brightness.dark,
  ),
  primaryColor: const Color(0xffeb06ff),
  primaryColorLight: const Color(0xffeb06ff),
  highlightColor: const Color(0xffeb06ff),
  backgroundColor: const Color(0xFF3450a1),
  canvasColor: const Color(0xFF041955),
  scaffoldBackgroundColor: const Color(0xFF3450a1),

  // bluColor : #007AFF
  // whiteColor: #FFFFFF
  // blueColor: #375572
  // desabledColor: #C4D4E0
  // desabledColorText: #577185

  // Define the default font family.
  // fontFamily: 'Georgia',

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: textTheme,
);

final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.roboto(
    fontSize: 97,
    fontWeight: FontWeight.w500,
  ),
  headline2: GoogleFonts.roboto(
    fontSize: 61,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.roboto(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.roboto(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);

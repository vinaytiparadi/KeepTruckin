import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xFF0962EA);
const textColor = Colors.black;
const textLightColor = Color(0xFFBFBFBF);
const facebookColor = Color(0xFF527BCB);
const signinBtnColor = Color(0xFFF5F9FA);
const cancelColor = Color(0xFFB10000);
const pendingColor = Color(0xFFF4CD00);
const workingColor = Color(0xFF3EC000);
const completeColor = Color(0xFF547BD2);


//height
double scHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//width
double scWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///hide keyboard
void hideKeyboard(context) => FocusScope.of(context).requestFocus(FocusNode());

OutlineInputBorder outlineEnabledBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
  );
}

//=================//
TextStyle headline1({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 20, color: color, fontWeight: FontWeight.w700);
}

TextStyle headline1ExtraBold({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 22, color: color, fontWeight: FontWeight.w800);
}

TextStyle headline2({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 18, color: color, fontWeight: FontWeight.w600);
}

TextStyle bodyText1({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 16, color: color, fontWeight: FontWeight.w400);
}

TextStyle bodyText1Bold({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 16, color: color, fontWeight: FontWeight.w600);
}

TextStyle receiptBold({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 16, color: color, fontWeight: FontWeight.w700);
}

TextStyle bodyText2({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 14, color: color, fontWeight: FontWeight.w400);
}

TextStyle bodyText2Bold({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 14, color: color, fontWeight: FontWeight.w600);
}

TextStyle bodyText2thin({Color color = textColor}) {
  return GoogleFonts.roboto(
      fontSize: 11, color: color, fontWeight: FontWeight.w400);
}

BoxDecoration boxDecoration(
    {double borderradius = 5,
      Color color = Colors.white,
      bool isBorder = false}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(borderradius),
      border: isBorder == true ? Border.all(color: color) : null,
      color: isBorder == true ? Colors.white : color,
      boxShadow: [
        BoxShadow(blurRadius: 5, color: textLightColor.withOpacity(0.5))
      ]);
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 14.0, right: 14.0, top: 14.0, bottom: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(value,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          // const Divider(color: Colors.grey, thickness: 0.2),
        ],
      ),
    );
  }
}


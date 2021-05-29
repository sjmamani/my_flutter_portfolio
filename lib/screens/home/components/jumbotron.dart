import 'package:flutter/material.dart';
import 'package:emojis/emojis.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_portfolio/constants.dart';
import 'package:my_flutter_portfolio/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

Widget separador = const SizedBox(
  height: 20,
);

class Jumbotron extends StatelessWidget {
  const Jumbotron({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/avatar.jpg'),
          maxRadius: 55,
          minRadius: 20,
        ),
        separador,
        Text(
          "Hi, I'm Santiago! ${Emojis.wavingHand}",
          style: TextStyle(fontSize: isMobile(context) ? 24 : 30),
          textAlign: TextAlign.center,
        ),
        separador,
        Text(
          "Building digital products, brands and experience.",
          style: TextStyle(fontSize: isMobile(context) ? 32 : 48),
          textAlign: TextAlign.center,
        ),
        separador,
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style:
                    TextStyle(fontFamily: GoogleFonts.robotoSlab().fontFamily),
                children: [
                  TextSpan(
                      text: 'An enthusiastic',
                      style: TextStyle(
                        fontSize: isMobile(context) ? 18 : 20,
                        color: kTextColor,
                      )),
                  TextSpan(
                      text: ' Flutter Developer',
                      style: TextStyle(
                        fontSize: isMobile(context) ? 18 : 20,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: ' and',
                      style: TextStyle(
                        fontSize: isMobile(context) ? 18 : 20,
                        color: kTextColor,
                      )),
                  TextSpan(
                      text: ' Software Engineering',
                      style: TextStyle(
                        fontSize: isMobile(context) ? 18 : 20,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text:
                          ' student.${!isMobile(context) ? '\n' : ' '}I specialize in Mobile and Web Apps Development, as well as Responsive Web ${!isMobile(context) ? '\n' : ''}Design.',
                      style: TextStyle(
                        fontSize: isMobile(context) ? 18 : 20,
                        color: kTextColor,
                      )),
                ])),
        separador,
        ElevatedButton(
            onPressed: () async {
              const url =
                  'https://drive.google.com/file/d/1VbXBZXTgA9deITr3vguO6UmAPqqosrkU/view?usp=sharing';
              await canLaunch(url)
                  ? await launch(url)
                  : throw 'Could not launc $url';
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15))),
            child: const Text(
              'DOWNLOAD MY CV',
              style: TextStyle(
                fontSize: 16,
              ),
            ))
      ],
    );
  }
}

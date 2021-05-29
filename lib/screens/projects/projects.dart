import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/responsive.dart';
import 'package:my_flutter_portfolio/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

const cardWidth = 220.0;
const cardHeight = 220.0;

class Projects extends StatelessWidget {
  const Projects({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
              projects.length,
              (index) => ProjectCard(index: index),
            )),
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(projects[widget.index].urlGithub),
      child: Container(
        height: isMobile(context) ? cardHeight * 0.75 : cardHeight,
        width: isMobile(context) ? cardWidth * 0.75 : cardWidth,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 12, spreadRadius: 5.5)
          ],
          image: DecorationImage(
            image: AssetImage(projects[widget.index].urlImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: const Color(0xFF686868).withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              height: isMobile(context) ? 40 : 60,
              width: double.infinity,
              child: Text(
                projects[widget.index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile(context) ? 14 : 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

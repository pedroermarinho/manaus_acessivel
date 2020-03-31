import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manausacessivel/app/components/text_field_custom/text_field_custom_widget.dart';
import 'package:manausacessivel/app/pages/about/about_controller.dart';

class AboutPage extends StatefulWidget {
  final String title;

  const AboutPage({Key key, this.title = "Sobre"}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final AboutController controller = Modular.get<AboutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Observer(
              builder: (_) {
                return Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                      child: Text(
                        controller.appName,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${controller.version}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          " + ${controller.buildNumber}",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Color(0xffe6c131),
                  backgroundImage: NetworkImage("https://avatars1.githubusercontent.com/u/29618874?s=460&u=440fc6f402924b4561bd42f6e743b973627485bc&v=4"),
                ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldCustomWidget(
                      controller:
                          TextEditingController(text: controller.nameDevelop),
                      textAlign: TextAlign.center,
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: controller.pushGithub,
                          child: FaIcon(
                            FontAwesomeIcons.github,
                            size: 60,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.pushLinkedin,
                          child: FaIcon(
                            FontAwesomeIcons.linkedin,
                            size: 60,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.pushWeb,
                          child: FaIcon(
                            Icons.web,
                            size: 75,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
    );
  }
}

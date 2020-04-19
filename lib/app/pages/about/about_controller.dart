import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

part 'about_controller.g.dart';

class AboutController = _AboutControllerBase with _$AboutController;

abstract class _AboutControllerBase with Store {
  @observable
  String appName = "";

  @observable
  String packageName = "";

  @observable
  String version = "";

  @observable
  String buildNumber = "";

  @observable
  String nameDevelop = "Pedro Marinho";

  _AboutControllerBase() {
    recoverInformation();
  }

  pushGithub() async {
    const url = 'https://github.com/pedroermarinho/manaus_acessivel';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  pushLinkedin() async {
    const url = 'https://www.linkedin.com/in/pedro-ermarinho/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  pushWeb() async {
    const url = 'https://pedroermarinho.github.io/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @action
  recoverInformation() async {
    PackageInfo.fromPlatform().then((packageInfo) {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }
}

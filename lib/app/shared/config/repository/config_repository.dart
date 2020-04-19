import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:manausacessivel/app/shared/config/repository/config_repository_interface.dart';

class ConfigRepository implements IConfigRepository {
  @override
  Future<String> getMysql() async {
    RemoteConfig remoteConfig = await RemoteConfig.instance;
    remoteConfig.fetch(expiration: Duration(hours: 1));
    remoteConfig.activateFetched();
    return remoteConfig.getValue('mysql_url').asString();
  }
}

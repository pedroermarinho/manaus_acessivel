import 'package:manausacessivel/app/shared/config/repository/config_repository_interface.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class ConfigRepository implements IConfigRepository {
  @override
  Future<String> getMysql() async {
    RemoteConfig remoteConfig = await RemoteConfig.instance;
    await remoteConfig.fetch(expiration: Duration(hours: 1));
    await remoteConfig.activateFetched();

    return  remoteConfig.getValue('mysql_url').asString();
  }
}

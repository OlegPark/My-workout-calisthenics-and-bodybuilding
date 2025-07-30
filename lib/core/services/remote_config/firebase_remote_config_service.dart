import 'package:my_workout_cab/core/services/remote_config/remote_config_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';


class RemoteConfigServiceFirebase implements RemoteConfigService {
  @override
  Future<void> init() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
  }

  @override
  Map<String, dynamic> getConfig(String key) {
    // TODO: implement getConfig
    throw UnimplementedError();
  }

  @override
  String getString(String key) {
    // TODO: implement getString
    throw UnimplementedError();
  }
}

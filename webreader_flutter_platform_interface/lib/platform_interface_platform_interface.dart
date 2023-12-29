import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_interface_method_channel.dart';

abstract class PlatformInterfacePlatform extends PlatformInterface {
  /// Constructs a PlatformInterfacePlatform.
  PlatformInterfacePlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformInterfacePlatform _instance = MethodChannelPlatformInterface();

  /// The default instance of [PlatformInterfacePlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformInterface].
  static PlatformInterfacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformInterfacePlatform] when
  /// they register themselves.
  static set instance(PlatformInterfacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

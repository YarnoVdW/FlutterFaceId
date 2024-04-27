import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'faceid_method_channel.dart';

abstract class FaceidPlatform extends PlatformInterface {
  /// Constructs a FaceidPlatform.
  FaceidPlatform() : super(token: _token);

  static final Object _token = Object();

  static FaceidPlatform _instance = MethodChannelFaceid();

  /// The default instance of [FaceidPlatform] to use.
  ///
  /// Defaults to [MethodChannelFaceid].
  static FaceidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FaceidPlatform] when
  /// they register themselves.
  static set instance(FaceidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Authenticates the user using Face ID.
  Future<bool> authenticate();
}

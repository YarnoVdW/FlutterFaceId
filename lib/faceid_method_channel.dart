import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'faceid_platform_interface.dart';

/// An implementation of [FaceidPlatform] that uses method channels.
class MethodChannelFaceid extends FaceidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('faceid');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

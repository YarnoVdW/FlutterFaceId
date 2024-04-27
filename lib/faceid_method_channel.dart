import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'faceid_platform_interface.dart';

class MethodChannelFaceid extends FaceidPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('faceid');

  @override
  Future<bool> authenticate() async {
    return await methodChannel.invokeMethod('authenticate');
  }
}

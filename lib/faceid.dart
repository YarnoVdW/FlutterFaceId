
import 'faceid_platform_interface.dart';

class Faceid {
  Future<String?> getPlatformVersion() {
    return FaceidPlatform.instance.getPlatformVersion();
  }
}

import 'faceid_platform_interface.dart';

class Faceid {
  Future<bool> authenticate() async {
    return FaceidPlatform.instance.authenticate();
  }
}

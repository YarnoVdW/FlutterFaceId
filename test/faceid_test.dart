import 'package:flutter_test/flutter_test.dart';
import 'package:biometric_auth/faceid_platform_interface.dart';
import 'package:biometric_auth/faceid_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFaceidPlatform
    with MockPlatformInterfaceMixin
    implements FaceidPlatform {
  @override
  Future<bool> authenticate() {
    return Future.value(true);
  }
}

void main() {
  final FaceidPlatform initialPlatform = FaceidPlatform.instance;

  test('$MethodChannelFaceid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFaceid>());
  });
}

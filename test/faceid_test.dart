import 'package:flutter_test/flutter_test.dart';
import 'package:faceid/faceid.dart';
import 'package:faceid/faceid_platform_interface.dart';
import 'package:faceid/faceid_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFaceidPlatform
    with MockPlatformInterfaceMixin
    implements FaceidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FaceidPlatform initialPlatform = FaceidPlatform.instance;

  test('$MethodChannelFaceid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFaceid>());
  });

  test('getPlatformVersion', () async {
    Faceid faceidPlugin = Faceid();
    MockFaceidPlatform fakePlatform = MockFaceidPlatform();
    FaceidPlatform.instance = fakePlatform;

    expect(await faceidPlugin.getPlatformVersion(), '42');
  });
}

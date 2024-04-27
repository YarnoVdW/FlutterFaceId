import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:biometric_auth/faceid_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFaceid platform = MethodChannelFaceid();
  const MethodChannel channel = MethodChannel('faceid');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('authenticate', () async {
    expect(await platform.authenticate(), 'true');
  });
}

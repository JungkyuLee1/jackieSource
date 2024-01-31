import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

import '../widgets/common_wideget.dart';
import 'package:flutter/material.dart';

class BioAuthController extends GetxController {
  var _localAuth = LocalAuthentication();
  var hasFingerprintLock = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getAllBiometrics();
  }

  //기존 정보 loading
  void _getAllBiometrics() async {
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;

    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics =
          await _localAuth.getAvailableBiometrics();

      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasFingerprintLock.value =
          availableBiometrics.contains(BiometricType.fingerprint);
    } else {
      Common.showSnackBar(
          'Error', 'Local Authentication not available', Colors.red);
    }
  }

  void authenticateUser() async {
    try {
      const androidMessage = AndroidAuthMessages(
          signInTitle: 'Oops! Biometric authentication required',
          cancelButton: 'Cancel',
          goToSettingsButton: 'settings',
          goToSettingsDescription: 'Please set up your Fingerprint/Face',
          biometricHint: 'Verify your identity');

      isUserAuthenticated.value = await _localAuth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        authMessages: [androidMessage],
        options: AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (isUserAuthenticated.value) {
        Common.showSnackBar('Success', 'You are authenticated', Colors.green);
      } else {
        Common.showSnackBar('Fail', 'Authentication Cancelled', Colors.red);
      }
    } catch (e) {
      Common.showSnackBar('Error', e.toString(), Colors.red);
    }
  }
}

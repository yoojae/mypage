import 'dart:core';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/member.dart';
import 'global_common_dialog.dart';

//공통
const String baseURL = "http://3.34.16.13:8080/api/v1/";

//네이버 주소 가지고 오기
const naverClientId = "equhwlbnk4";
const naverClientSecret = "O8ehmtwCc4MKZW1kAhyVS89bGwMwbUlj68oVTiE1";

///앱 메인 패딩 밸류

EdgeInsets AppbarlessAllPadding(BuildContext context) =>
    EdgeInsets.only(top: 0.h, bottom: 48.h, left: 20.w, right: 20.w);

EdgeInsets AppbarTLRPadding(BuildContext context) =>
    EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w);

EdgeInsets ButtonAllPadding(BuildContext context) =>
    EdgeInsets.only(top: 48.h, bottom: 48.h, left: 20.w, right: 20.w);

//공통함수
class Common {
  static double getLength(int textLength) {
    double returnValue = 200.w;

    List lengthList = [
      30.w,
      45.w,
      60.w,
      78.w,
      80.w,
      80.w,
      90.w,
      100.w,
      110.w,
      120.w,
      130.w,
      130.w,
      140.w,
      130.w,
      150.w,
    ];

    if (textLength < 16) {
      returnValue = lengthList[textLength - 1];
    }
    return returnValue;
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  static String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  static String getNaverClientId() {
    return naverClientId;
  }

  static Future<bool> setLocalAuth() async {
    bool returnBoolValue = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<BiometricType> availableBiometrics =
          await LocalAuthentication().getAvailableBiometrics();

      if ((Platform.isIOS || Platform.isAndroid) &&
          (availableBiometrics.contains(BiometricType.strong) ||
              availableBiometrics.contains(BiometricType.face))) {
        returnBoolValue = await LocalAuthentication()
            .authenticate(localizedReason: '로그인을 위해 휴대폰 인증 도구로 인증하세요.');
      }

      if (returnBoolValue) {
        prefs.setBool("isAuth", true);
        prefs.setBool("isBio", true);
      }
      // ignore: unused_catch_clause
    } on PlatformException catch (e) {
      prefs.setBool("isAuth", false);
      prefs.setBool("isBio", false);
    }

    return returnBoolValue;
  }

  static Future<bool> gotoLocalAuth(bool setLoginInfo) async {
    bool returnBoolValue = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isBio') ?? false) {
      try {
        List<BiometricType> availableBiometrics =
            await LocalAuthentication().getAvailableBiometrics();

        if ((Platform.isIOS || Platform.isAndroid) &&
            (availableBiometrics.contains(BiometricType.face) ||
                availableBiometrics.contains(BiometricType.fingerprint))) {
          returnBoolValue = await LocalAuthentication()
              .authenticate(localizedReason: '로그인을 위해 휴대폰 인증 도구로 인증하세요.');
        }

        if (returnBoolValue) {
          // if (setLoginInfo) {
          //   loginInfo.bizId = prefs.getString("bizId");
          //   loginInfo.bizName = prefs.getString("bizName");
          //   loginInfo.loginId = prefs.getString("loginId");
          //   loginInfo.userId = prefs.getString("userId");
          //   loginInfo.userName = prefs.getString("userName");
          // }
        }
        // ignore: unused_catch_clause
      } on PlatformException catch (e) {
        prefs.setBool("isBio", false);
      }
    }
    return returnBoolValue;
  }

  static Future<bool> isCanFirstLocalAuth() async {
    bool returnBoolValue = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if ((prefs.getBool('isBio') ?? false) &&
        (prefs.getBool('isFirst') ?? true)) {
      try {
        List<BiometricType> availableBiometrics =
            await LocalAuthentication().getAvailableBiometrics();

        if ((Platform.isIOS || Platform.isAndroid) &&
            (availableBiometrics.contains(BiometricType.face) ||
                availableBiometrics.contains(BiometricType.fingerprint))) {
          returnBoolValue = true;
        }
        // ignore: unused_catch_clause
      } on PlatformException catch (e) {
        prefs.setBool("isAuth", false);
        prefs.setBool("isBio", false);
      }
    }

    prefs.setBool("isFirst", false);
    return returnBoolValue;
  }

  static Future<String> getMobileId() async {
    // DeviceInfoPlugin 클래스 생성
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    // id 저장할 변수
    String id = '';
    try {
      // 플랫폼 확인
      if (Platform.isAndroid) {
        // 안드로이드의 경우 androidInfo를 이용
        // 이때 await으로 데이터 받을때까지 대기를 해야함
        final AndroidDeviceInfo androidData =
            await deviceInfoPlugin.androidInfo;
        // 전달 받은 변수의 멤버 변수인 androidId가 고유 id이다.
        id = androidData.id;
      } else if (Platform.isIOS) {
        // iOS의 경우 iosInfo를 이용
        // 이때 await으로 데이터 받을때까지 대기를 해야함
        final IosDeviceInfo iosData = await deviceInfoPlugin.iosInfo;
        // 전달 받은 변수의 멤버 변수인 identifierForVendor가 고유 id이다.
        id = iosData.identifierForVendor ?? "";
      }
    } on PlatformException {
      // 어떠한 원인으로 실패할 경우
      id = '';
    }
    // id 한번 출력해보고
    print('id: $id');
    // 값 리턴
    return id;
  }

  static Future<void> saveLocalMemberData(Member? member) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //저장하기
    prefs.setString("userName", member?.name ?? "");
    prefs.setString("userPass", member?.securityNumber ?? "");
  }

  static Future<void> saveAuthPassword(bool isLockPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //저장하기
    prefs.setBool("isLockPassword", isLockPassword);
  }

  static Future<void> saveServerReturnMemberData(
      String? authToken, String? uuid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //저장하기
    prefs.setString("authToken", authToken ?? "");
    prefs.setString("uuid", uuid ?? "");
  }

  static Future<String> getSavedPassWord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("userPass") ?? "";
  }

  static Future<String> getSavedUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("userName") ?? "";
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("authToken") ?? "";
  }

  static Future<String> getUUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("uuid") ?? "";
  }

  static String birthDay(String residentNumber) {
    String returnValue = "";

    if (residentNumber.length == 6) {
      returnValue =
          "${residentNumber.substring(0, 2).compareTo("10") > 0 ? "19" : "20"}$residentNumber";
      returnValue =
          "${returnValue.substring(0, 4)}년 ${returnValue.substring(4, 6)}월 ${returnValue.substring(6, 8)}일";
    }
    return returnValue;
  }

  static String getKoreanDateString(String dateString) {
    String returnValue = "";

    if (dateString.length == 10) {
      returnValue = dateString.replaceAll("-", "");
      returnValue =
          "${returnValue.substring(0, 4)}년 ${returnValue.substring(4, 6)}월 ${returnValue.substring(6, 8)}일";
    }
    return returnValue;
  }

  static Future<bool> isLocationPermission() async {
    bool isUesLocation = false;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      isUesLocation = true;
    } else {
      await CommonDaialog(
        contents: "위치 검색 약관 동의",
        width: 310.w,
        height: 160.h,
        buttonCount: 2,
        confirmFuntion: () {
          isUesLocation = true;
          Get.back();
        },
        cancelFuntion: () {
          Get.back();
        },
      ).show();
    }
    return isUesLocation;
  }

  static Future<void> getRequiredLocationPermmision() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.back();
      }
    }
  }
}

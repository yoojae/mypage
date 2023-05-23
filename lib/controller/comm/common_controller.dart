import 'dart:convert';

import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../global_asset/common.dart';

class CommonController extends GetxController {
  static CommonController get to => Get.find();

  Map<String, String> headerss = {
    "X-NCP-APIGW-API-KEY-ID": naverClientId, // 개인 클라이언트 아이디
    "X-NCP-APIGW-API-KEY": naverClientSecret // 개인 시크릿 키
  };

  Future<List> fetchData(double dlat, double dlon) async {
    String lat = dlat.toString();
    String lon = dlon.toString();

    String roadAddrString = "";
    String addrString = "";

    var roadAddr;
    var addr;

    print("$lon,$lat");

    var response = await get(Uri.parse(
            //이 부분이 코딩셰프님 영상과 차이가 있다. 플러터 버젼업이 되면서 이 메소드를 써야 제대로 uri를 인식한다.
            "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=${lon},${lat}&orders=roadaddr,addr&output=json"),
        headers: headerss);
    // 미리 만들어둔 headers map을 헤더에 넣어준다.
    String jsonData = response.body;
    //response에서 body부분만 받아주는 변수 만들어주공~
    if (jsonDecode(jsonData)["status"]["code"] == 0) {
      var resultObject = jsonDecode(jsonData);

      // 도로명 주소
      if (resultObject["results"][0]["name"] == "roadaddr") {
        roadAddr = resultObject["results"][0];
      }

      if (resultObject["results"][1]["name"] == "roadaddr") {
        roadAddr = resultObject["results"][1];
      }

      //지역명 주소
      if (resultObject["results"][0]["name"] == "addr") {
        addr = resultObject["results"][0];
      }

      if (resultObject["results"][1]["name"] == "addr") {
        addr = resultObject["results"][1];
      }

      roadAddrString = "${roadAddr['region']['area1']['name']}";

      if ("${roadAddr['region']['area2']['name']}".isNotEmpty) {
        roadAddrString =
            "$roadAddrString ${roadAddr['region']['area2']['name']}";
      }

      if ("${roadAddr['region']['area3']['name']}".isNotEmpty) {
        roadAddrString =
            "$roadAddrString ${roadAddr['region']['area3']['name']}";
      }

      if ("${roadAddr['region']['area4']['name']}".isNotEmpty) {
        roadAddrString =
            "$roadAddrString ${roadAddr['region']['area4']['name']}";
      }

      if ("${roadAddr['land']['number1']}".isNotEmpty) {
        roadAddrString = "$roadAddrString ${roadAddr['land']['number1']}";
      }

      if ("${roadAddr['land']['number2']}".isNotEmpty) {
        roadAddrString = "$roadAddrString ${roadAddr['land']['number2']}";
      }

      if ("${roadAddr['land']['addition0']['value']}".isNotEmpty) {
        roadAddrString =
            "$roadAddrString ${roadAddr['land']['addition0']['value']}";
      }

      //지번주소
      addrString = "${addr['region']['area1']['name']}";

      if ("${roadAddr['region']['area2']['name']}".isNotEmpty) {
        addrString = "$addrString ${addr['region']['area2']['name']}";
      }

      if ("${roadAddr['region']['area3']['name']}".isNotEmpty) {
        addrString = "$addrString ${addr['region']['area3']['name']}";
      }

      if ("${roadAddr['region']['area4']['name']}".isNotEmpty) {
        addrString = "$addrString ${addr['region']['area4']['name']}";
      }

      if ("${roadAddr['land']['number1']}".isNotEmpty) {
        addrString = "$addrString ${addr['land']['number1']}";
      }

      if ("${roadAddr['land']['number2']}".isNotEmpty) {
        addrString = "$addrString ${addr['land']['number2']}";
      }

      if ("${roadAddr['land']['addition0']['value']}".isNotEmpty) {
        addrString = "$addrString ${addr['land']['addition0']['value']}";
      }

      List<String> gusi = [roadAddrString, addrString];

      print("$roadAddrString,$addrString");

      return gusi; //구랑 시를 받아서 gusi라는 귀여운 이름으로 받는다...?
    } else {
      print('주소없음');
      return [null, null];
    }
  }

  Future<String> fetchShortData(double dlat, double dlon) async {
    String lat = dlat.toString();
    String lon = dlon.toString();

    String roadAddrString = "";

    var response = await get(Uri.parse(
            //이 부분이 코딩셰프님 영상과 차이가 있다. 플러터 버젼업이 되면서 이 메소드를 써야 제대로 uri를 인식한다.
            "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=${lon},${lat}&orders=roadaddr,addr&output=json"),
        headers: headerss);
    // 미리 만들어둔 headers map을 헤더에 넣어준다.
    String jsonData = response.body;
    //response에서 body부분만 받아주는 변수 만들어주공~
    if (jsonDecode(jsonData)["status"]["code"] == 0) {
      var resultObject = jsonDecode(jsonData);

      // 도로명 주소
      if (resultObject["results"][0]["name"] == "roadaddr") {
        var obj = resultObject["results"][0];

        roadAddrString = "";

        if ("${obj['region']['area3']['name']}".isNotEmpty) {
          roadAddrString = "$roadAddrString ${obj['region']['area3']['name']}";
        }

        if ("${obj['region']['area4']['name']}".isNotEmpty) {
          roadAddrString = "$roadAddrString ${obj['region']['area4']['name']}";
        }

        if ("${obj['land']['number1']}".isNotEmpty) {
          roadAddrString = "$roadAddrString ${obj['land']['number1']}";
        }

        if ("${obj['land']['number2']}".isNotEmpty) {
          roadAddrString = "$roadAddrString ${obj['land']['number2']}";
        }

        if ("${obj['land']['addition0']['value']}".isNotEmpty) {
          roadAddrString =
              "$roadAddrString ${obj['land']['addition0']['value']}";
        }
      }

      return roadAddrString; //구랑 시를 받아서 gusi라는 귀여운 이름으로 받는다...?
    } else {
      print('주소없음');
      return "";
    }
  }
}

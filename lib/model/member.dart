import 'package:orot/model/disease.dart';
import 'package:orot/model/term_agree.dart';
import 'package:orot/model/unborn.dart';

class Member {
  String? name;
  String? residentNumber;
  String? mobileCarrier;
  String? phoneNumber;
  String? securityNumber;
  String? address;
  String? deliver;
  int? age;
  bool? isSecurity;
  bool? isWork;
  String? preDisease;
  String? afterDisease;
  bool? isMiscarriage;
  List<TermAgree>? termAgree;
  List<Disease>? diseases;
  List<Unborn>? unborns;
  String? uuid;

  String? profileImageUrl;
  int? day;
  String? type;

  Member(
      {this.name,
      this.residentNumber,
      this.mobileCarrier,
      this.phoneNumber,
      this.securityNumber,
      this.address,
      this.deliver,
      this.age,
      this.isSecurity,
      this.isWork,
      this.preDisease,
      this.afterDisease,
      this.isMiscarriage,
      this.termAgree,
      this.diseases,
      this.unborns,
      this.uuid,
      this.profileImageUrl,
      this.day,
      this.type});

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        name: json['name'],
        residentNumber: json['resident_number'],
        mobileCarrier: json['mobile_carrier'],
        phoneNumber: json['phone_number'],
        securityNumber: json['security_number'],
        address: json['address'],
        deliver: json['deliver'],
        age: json['age'],
        isSecurity: json['is_security'] == 1,
        isWork: json['is_work'] == 1,
        preDisease: json['pre_disease'],
        afterDisease: json['after_disease'],
        isMiscarriage: json['is_miscarriage'] == 1,
        uuid: json['uuid'],
        profileImageUrl: json['profile_image_url'],
        day: json['day'],
        type: json['type'],
        diseases: json["diseases"] == null
            ? <Disease>[]
            : List<Disease>.from(
                json["diseases"].map((data) => Disease.fromJson(data))),
        unborns: json["unborns"] == null
            ? <Unborn>[]
            : List<Unborn>.from(
                json["unborns"].map((data) => Unborn.fromJson(data))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "resident_number": residentNumber,
        "mobile_carrier": mobileCarrier,
        "phone_number": phoneNumber,
        "security_number": securityNumber,
        "address": address,
        "deliver": deliver,
        "age": age,
        "uuid": uuid
      };

  Map<String, dynamic> toSavedJson() => {
        "address": address,
        "deliver": deliver,
        "is_security": isSecurity,
        "is_work": isWork,
        "pre_disease": preDisease,
        "after_disease": afterDisease,
        "is_miscarriage": isMiscarriage,
        "term_agree": termAgree,
        "diseases": diseases,
        "unborns": unborns,
      };

  Map<String, dynamic> toInsertJson() => {
        "name": name,
        "resident_number": residentNumber,
        "mobile_carrier": mobileCarrier,
        "phone_number": phoneNumber,
        "security_number": securityNumber,
        "address": address,
        "deliver": deliver,
        "age": age,
        "is_security": isSecurity,
        "is_work": isWork,
        "pre_disease": preDisease,
        "after_disease": afterDisease,
        "is_miscarriage": isMiscarriage,
        "term_agree": termAgree,
        "diseases": diseases,
        "unborns": unborns,
        "uuid": uuid
      };

  factory Member.clone(Member member) {
    return Member(
        name: member.name,
        residentNumber: member.residentNumber,
        mobileCarrier: member.mobileCarrier,
        phoneNumber: member.phoneNumber,
        securityNumber: member.securityNumber,
        address: member.address,
        deliver: member.deliver,
        age: member.age,
        isSecurity: member.isSecurity,
        isWork: member.isWork,
        preDisease: member.preDisease,
        afterDisease: member.afterDisease,
        isMiscarriage: member.isMiscarriage,
        termAgree: member.termAgree,
        diseases: member.diseases,
        unborns: member.unborns,
        uuid: member.uuid);
  }
}

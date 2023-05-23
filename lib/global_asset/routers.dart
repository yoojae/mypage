import 'package:get/get.dart';
import 'package:orot/controller/global_asset/address_select_controller.dart';
import 'package:orot/controller/global_asset/bottom_calender_controller.dart';
import 'package:orot/controller/home/home_page_controller.dart';
import 'package:orot/controller/mypage/alarm_list_controller.dart';
import 'package:orot/controller/mypage/alarm_set_controller.dart';
import 'package:orot/controller/mypage/alarm_view_controller.dart';
import 'package:orot/controller/mypage/app_information_list_controller.dart';
import 'package:orot/controller/mypage/company_information_controller.dart';
import 'package:orot/controller/mypage/customer_support_controller.dart';
import 'package:orot/controller/mypage/detail_hospital)controller.dart';
import 'package:orot/controller/mypage/inquiry_controller.dart';
import 'package:orot/controller/mypage/instructions_controller.dart';

import 'package:orot/controller/mypage/lock_number_controller.dart';
import 'package:orot/controller/mypage/myinfo_controller.dart';
import 'package:orot/controller/mypage/myinfo_edit_controller.dart';
import 'package:orot/controller/mypage/mypage_main_controller.dart';
import 'package:orot/controller/mypage/nearby_hospital_controller.dart';
import 'package:orot/controller/mypage/notice_view_controller.dart';
import 'package:orot/controller/mypage/now_position_controller.dart';
import 'package:orot/controller/mypage/register_myhospital_controller.dart';
import 'package:orot/controller/mypage/search_hospital_controller.dart';
import 'package:orot/controller/mypage/terms_and_policies_list_controller.dart';
import 'package:orot/controller/mypage/terms_and_policies_view_controller.dart';
import 'package:orot/controller/mypage/version_information_controller.dart';
import 'package:orot/controller/register/register_info_all_edit_page_controller.dart';
import 'package:orot/controller/register/register_info_all_new_page_controller.dart';
import 'package:orot/controller/register/register_info_step00_new_page_controller.dart';
import 'package:orot/controller/register/register_info_step01_edit_page_controller.dart';
import 'package:orot/controller/register/register_info_step02_edit_page_controller.dart';
import 'package:orot/controller/register/register_info_step02_new_page_controller.dart';
import 'package:orot/controller/register/register_info_step03_edit_page_controller.dart';
import 'package:orot/controller/register/register_info_step03_new_page_controller.dart';
import 'package:orot/controller/register/register_info_step04_edit_page_controller.dart';
import 'package:orot/controller/register/register_info_step04_new_page_controller.dart';
import 'package:orot/controller/register/register_info_step05_edit_page_controller.dart';
import 'package:orot/controller/register/register_info_step05_new_page_controller.dart';
import 'package:orot/controller/register/register_info_step06_edit_page_controller.dart';
import 'package:orot/controller/register/register_info_step06_new_page_controller.dart';
import 'package:orot/controller/register/register_New_login_number_controller.dart';
import 'package:orot/controller/register/register_lock_biouse_controller.dart';
import 'package:orot/controller/register/register_lock_use_controller.dart';
import 'package:orot/controller/register/register_terms_page_controller.dart';
import 'package:orot/controller/register/terms_view_web_controller.dart';
import 'package:orot/controller/register/welcome_to_new_controller.dart';
import 'package:orot/global_asset/address_select.dart';
import 'package:orot/global_asset/bottom_calendar.dart';
import 'package:orot/ui/home/page/hone_page.dart';
import 'package:orot/ui/mypage/alarm_list.dart';
import 'package:orot/ui/mypage/alarm_set.dart';
import 'package:orot/ui/mypage/alarm_view.dart';
import 'package:orot/ui/mypage/appinformation/app_information_list.dart';
import 'package:orot/ui/mypage/appinformation/company_information.dart';
import 'package:orot/ui/mypage/appinformation/terms_and_policies_list.dart';
import 'package:orot/ui/mypage/appinformation/terms_and_policies_view.dart';
import 'package:orot/ui/mypage/appinformation/version_information.dart';
import 'package:orot/ui/mypage/customersupport/customer_support.dart';
import 'package:orot/ui/mypage/hospital/detail_hospital.dart';
import 'package:orot/ui/mypage/hospital/nearby_hospital.dart';
import 'package:orot/ui/mypage/hospital/now_position.dart';
import 'package:orot/ui/mypage/hospital/register_myhospital.dart';
import 'package:orot/ui/mypage/hospital/search_hospital.dart';
import 'package:orot/ui/mypage/inquiry/inquiry.dart';
import 'package:orot/ui/mypage/instructions/instructions.dart';
import 'package:orot/ui/mypage/lock_number.dart';
import 'package:orot/ui/mypage/myinfo.dart';
import 'package:orot/ui/mypage/myinfo_edit.dart';
import 'package:orot/ui/mypage/mypage_main.dart';
import 'package:orot/ui/mypage/notice/notice_list.dart';
import 'package:orot/ui/mypage/notice/notice_view.dart';
import 'package:orot/ui/register/page/register_info_all_edit_page.dart';
import 'package:orot/ui/register/page/register_info_all_new_page.dart';
import 'package:orot/ui/register/page/register_info_step00_new_page.dart';
import 'package:orot/ui/register/page/register_info_step01_edit_page.dart';
import 'package:orot/ui/register/page/register_info_step01_new_page.dart';
import 'package:orot/ui/register/page/register_info_step02_edit_page.dart';
import 'package:orot/ui/register/page/register_info_step02_new_page.dart';
import 'package:orot/ui/register/page/register_info_step03_edit_page.dart';
import 'package:orot/ui/register/page/register_info_step03_new_page.dart';
import 'package:orot/ui/register/page/register_info_step04_edit_page.dart';
import 'package:orot/ui/register/page/register_info_step04_new_page.dart';
import 'package:orot/ui/register/page/register_info_step05_edit_page.dart';
import 'package:orot/ui/register/page/register_info_step05_new_page.dart';
import 'package:orot/ui/register/page/register_info_step06_edit_page.dart';
import 'package:orot/ui/register/page/register_info_step06_new_page.dart';
import 'package:orot/ui/register/page/register_lock_biouse.dart';
import 'package:orot/ui/register/page/register_lock_use.dart';
import 'package:orot/ui/register/page/register_new_login_number.dart';
import 'package:orot/ui/register/page/register_new_login_number_re.dart';
import 'package:orot/ui/register/page/register_terms_page.dart';
import 'package:orot/ui/register/page/welcome_to_new.dart';
import 'package:orot/ui/register/view/terms_view_web_01.dart';
import '../controller/register/register_info_step01_new_page_controller.dart';
import '../controller/register/register_new_login_number_re_controller.dart';

class RouterPages {
  static final routes = [
    GetPage(
        name: '/',
        page: () => HomePage(),
        binding: BindingsBuilder(() {
          Get.put<HomePageController>(HomePageController());
        })),
    GetPage(
        name: '/ResisterTermsPage',
        page: () => ResisterTermsPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterTermsPageController>(ResisterTermsPageController());
        })),
    GetPage(
        name: '/TermsViewWeb01',
        page: () => TermsViewWeb01(),
        binding: BindingsBuilder(() {
          Get.put<TermsView_webController>(TermsView_webController());
        })),
    GetPage(
        name: '/ResisterInfoStep01Page',
        page: () => ResisterInfoStep01Page(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep01NewPageController>(
              ResisterInfoStep01NewPageController());
        })),
    GetPage(
        name: '/AddressSelect',
        page: () => AddressSelect(),
        binding: BindingsBuilder(() {
          Get.put<AddressSelectController>(AddressSelectController());
        })),
    GetPage(
        name: '/ResisterInfoStep02Page',
        page: () => ResisterInfoStep02Page(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep02NewPageController>(
              ResisterInfoStep02NewPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep03Page',
        page: () => ResisterInfoStep03Page(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep03NewPageController>(
              ResisterInfoStep03NewPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep04Page',
        page: () => ResisterInfoStep04Page(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep04NewPageController>(
              ResisterInfoStep04NewPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep05Page',
        page: () => ResisterInfoStep05Page(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep05NewPageController>(
              ResisterInfoStep05NewPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep06Page',
        page: () => ResisterInfoStep06Page(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep06NewPageController>(
              ResisterInfoStep06NewPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep00Page',
        page: () => ResisterInfoStep00Page(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep00NewPageController>(
              ResisterInfoStep00NewPageController());
        })),
    GetPage(
        name: '/ResisterInfoAllNewPage',
        page: () => ResisterInfoAllNewPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoAllNewPageController>(
              ResisterInfoAllNewPageController());
        })),
    GetPage(
        name: '/ResisterInfoAllEditPage',
        page: () => ResisterInfoAllEditPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoAllEditPageController>(
              ResisterInfoAllEditPageController());
        })),
    GetPage(
        name: '/ResisterNewLoginNumber',
        page: () => ResisterNewLoginNumber(),
        binding: BindingsBuilder(() {
          Get.put<ResisterNewLoginNumberController>(
              ResisterNewLoginNumberController());
        })),
    GetPage(
        name: '/ResisterNewLoginNumberRe',
        page: () => ResisterNewLoginNumberRe(),
        binding: BindingsBuilder(() {
          Get.put<ResisterNewLoginNumberReController>(
              ResisterNewLoginNumberReController());
        })),
    GetPage(
        name: '/BottomCalender',
        page: () => BottomCalender(),
        binding: BindingsBuilder(() {
          Get.put<BottomCalenderController>(BottomCalenderController());
        })),
    GetPage(
        name: '/RegisterLockUse',
        page: () => RegisterLockUse(),
        binding: BindingsBuilder(() {
          Get.put<RegisterLockUseController>(RegisterLockUseController());
        })),
    GetPage(
        name: '/RegisterLockBioUse',
        page: () => RegisterLockBioUse(),
        binding: BindingsBuilder(() {
          Get.put<RegisterLockBioUseController>(RegisterLockBioUseController());
        })),
    GetPage(
        name: '/WelcometoNew',
        page: () => WelcometoNew(),
        binding: BindingsBuilder(() {
          Get.put<WelcometoNewController>(WelcometoNewController());
        })),
    GetPage(
        name: '/ResisterInfoStep01EditPage',
        page: () => ResisterInfoStep01EditPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep01EditPageController>(
              ResisterInfoStep01EditPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep02EditPage',
        page: () => ResisterInfoStep02EditPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep02EditPageController>(
              ResisterInfoStep02EditPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep03EditPage',
        page: () => ResisterInfoStep03EditPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep03EditPageController>(
              ResisterInfoStep03EditPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep04EditPage',
        page: () => ResisterInfoStep04EditPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep04EditPageController>(
              ResisterInfoStep04EditPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep05EditPage',
        page: () => ResisterInfoStep05EditPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep05EditPageController>(
              ResisterInfoStep05EditPageController());
        })),
    GetPage(
        name: '/ResisterInfoStep06EditPage',
        page: () => ResisterInfoStep06EditPage(),
        binding: BindingsBuilder(() {
          Get.put<ResisterInfoStep06EditPageController>(
              ResisterInfoStep06EditPageController());
        })),
    GetPage(
        name: '/LockNumber',
        page: () => LockNumber(),
        binding: BindingsBuilder(() {
          Get.put<LockNumberController>(LockNumberController());
        })),
    GetPage(
        name: '/AlarmList',
        page: () => AlarmList(),
        binding: BindingsBuilder(() {
          Get.put<AlarmListController>(AlarmListController());
        })),
    GetPage(
        name: '/AlarmView',
        page: () => AlarmView(),
        binding: BindingsBuilder(() {
          Get.put<AlarmViewController>(AlarmViewController());
        })),
    GetPage(
        name: '/AlarmSet',
        page: () => AlarmSet(),
        binding: BindingsBuilder(() {
          Get.put<AlarmSetController>(AlarmSetController());
        })),
    GetPage(
        name: '/MypageMain',
        page: () => MypageMain(),
        binding: BindingsBuilder(() {
          Get.put<MypageMainController>(MypageMainController());
        })),
    GetPage(
        name: '/MyInfo',
        page: () => MyInfo(),
        binding: BindingsBuilder(() {
          Get.put<MyInfoController>(MyInfoController());
        })),
    GetPage(
        name: '/MyInfoEdit',
        page: () => MyInfoEdit(),
        binding: BindingsBuilder(() {
          Get.put<MyInfoEditController>(MyInfoEditController());
        })),
    GetPage(
        name: '/MyInfoEdit',
        page: () => MyInfoEdit(),
        binding: BindingsBuilder(() {
          Get.put<MyInfoEditController>(MyInfoEditController());
        })),
    GetPage(
        name: '/NoticeView',
        page: () => NoticeView(),
        binding: BindingsBuilder(() {
          Get.put<NoticeViewController>(NoticeViewController());
        })),
    GetPage(
        name: '/NoticeList',
        page: () => NoticeList(),
        binding: BindingsBuilder(() {
          Get.put<NoticeViewController>(NoticeViewController());
        })),
    GetPage(
        name: '/CustomerSupport',
        page: () => CustomerSupport(),
        binding: BindingsBuilder(() {
          Get.put<CustomerSupportController>(CustomerSupportController());
        })),
    GetPage(
        name: '/Instructions',
        page: () => Instructions(),
        binding: BindingsBuilder(() {
          Get.put<InstructionsController>(InstructionsController());
        })),
    GetPage(
        name: '/AppInformationList',
        page: () => AppInformationList(),
        binding: BindingsBuilder(() {
          Get.put<AppInformationListController>(AppInformationListController());
        })),
    GetPage(
        name: '/CompanyInformation',
        page: () => CompanyInformation(),
        binding: BindingsBuilder(() {
          Get.put<CompanyInformationController>(CompanyInformationController());
        })),
    GetPage(
        name: '/TermsAndPoliciesList',
        page: () => TermsAndPoliciesList(),
        binding: BindingsBuilder(() {
          Get.put<TermsAndPoliciesListController>(
              TermsAndPoliciesListController());
        })),
    GetPage(
        name: '/TermsAndPoliciesView',
        page: () => TermsAndPoliciesView(),
        binding: BindingsBuilder(() {
          Get.put<TermsAndPoliciesViewController>(
              TermsAndPoliciesViewController());
        })),
    GetPage(
        name: '/VersionInformation',
        page: () => VersionInformation(),
        binding: BindingsBuilder(() {
          Get.put<VersionInformationController>(VersionInformationController());
        })),
    GetPage(
        name: '/InquiryPage',
        page: () => InquiryPage(),
        binding: BindingsBuilder(() {
          Get.put<InquiryController>(InquiryController());
        })),
    GetPage(
        name: '/RegisterMyHospital',
        page: () => RegisterMyHospital(),
        binding: BindingsBuilder(() {
          Get.put<RegisterMyHospitalController>(RegisterMyHospitalController());
        })),
    GetPage(
        name: '/SearchHospital',
        page: () => SearchHospital(),
        binding: BindingsBuilder(() {
          Get.put<SearchHospitalController>(SearchHospitalController());
        })),
    GetPage(
        name: '/NowPosition',
        page: () => NowPosition(),
        binding: BindingsBuilder(() {
          Get.put<NowPositionController>(NowPositionController());
        })),
    GetPage(
        name: '/NearbyHospital',
        page: () => NearbyHospital(),
        binding: BindingsBuilder(() {
          Get.put<NearbyHospitalController>(NearbyHospitalController());
        })),
    GetPage(
        name: '/DetailHospital',
        page: () => DetailHospital(),
        binding: BindingsBuilder(() {
          Get.put<DetailHospitalController>(DetailHospitalController());
        })),
  ];
}

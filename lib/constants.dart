
import 'package:flutter/material.dart';

class Constants {
  /// font sizes
  static const double fntNormalSize = 13;
  static const double fntMiddleSize = 14;
  static const double fntBigSize = 16;
  static const double fntMoreBigSize = 18;
  static const double fntLargeSize = 20;

  /// screen sizes
  static const double screenMinHeight = 600;
  static const double screenMinWidth = 600;
  static const double screenMaxHeight = 800;
  static const double screenMaxWidth = 600;
  static const double screenOneWidthLimit = 1000;

  /// border radius
  static const double buttonRadius = 15;
  static const double buttonRadiusBig = 30;
  static const double tabRadius = 25;
  static const double containerRadius = 5;
  static const double editRadius = 5;
  static const double itemRadius = 5;
  static const double blockRadius = 25;
  static const double menuRadius = 15;
  static const double imageRadius = 10;

  /// border width
  static const double generalBorderWidth = 1.3;

  /// colors
  static const Color secondaryColor = Color(0xff33cccc);
  static const Color thirdColor = Color(0xff3366ff);
  static const Color greenColor = Color(0xff799411);
  static const Color focusColor = Color(0xff5046e4);
  static const Color normalColor = Color(0xff7194a1);
  static const Color deactiveColor = Color(0xffb2bcc0);
  static const Color strongTextColor = Color(0xff0b2028);
  static const Color lightTextColor = Color(0xfffafafa);
  //static const Color primaryBgColor = Color(0xfffafafa);
  static const Color primaryBgColor = Color(0xffffffff);
  static const Color secondBgColor = Color(0xffeff5f8);
  static const Color thirdBgColor = Color(0xfff2f1ff);//Color(0xfff1f8fc);
  static const Color tabBgColor = Color(0xfff1f6fa);
  static const Color whiteColor = Color(0xffffffff);
  static const Color mainBgColor = Color(0xfff2f1ff);
  static const Color grayBgColor = Color(0xfff0f0f0);
  //static const Color lightThemeColor = Color(0xfffafafa);
  static const Color darkThemeColor = Color(0xffc9d4d9);//Color(0x607194A1);//Color(0xffd7e1e5);
  static const Color borderColor = Color(0xffc9d4d9);//Color(0x607194A1);//Color(0xffd7e1e5);
  static const Color appTitleBgColor = Color(0xffffffff);
  static const Color appTitleTextColor = Color(0xff0b2028);
  static const Color middleDarkColor = Color(0xffcccccc);
  static const Color darkIconColor = Color(0xff292d32);
  static const Color dividerColor = Color(0xffe6edf1);
  static const Color selectedBgColor = Color(0x335046e4);
  static const Color errorColor = Color(0xffff0000);

  static const companyDefaultBgColors = [Color(0xff4B9567), Color(0xff4B9567), Color(0xff000000)];

  /// basic company Id
  static const String baseCompanyId = 'main';

  /// template id for main company Id
  /// base template as base, for keeping original
  static const String baseTemplateId = 'template_base';
  /// base default template
  static const String defaultTemplateId = 'template_default';

  /// document template
  static const String defaultQuestFormId = 'form_default';
  static const String prefixQuestFormId = 'form';

  /// default appointment file type
  static const String defaultAppointmentFileTypeId = '2';
  static const String defaultAppointmentFileTypeLabel = 'Report - Property/Home Inspection';

  /// admin company mark
  static const String adminCompanyMark = 'https://firebasestorage.googleapis.com/v0/b/powrsoft.appspot.com/o/company%2FHS_Advantage--Inspection_R7-01.png?alt=media&token=56c7c989-d17b-4969-888d-2f489a256bc3';
  static const String companyMarkMid = 'https://firebasestorage.googleapis.com/v0/b/powrsoft.appspot.com/o/company%2FHS_Advantage--Inspection_R7-01.png?alt=media&token=56c7c989-d17b-4969-888d-2f489a256bc3';
  static const String companyMarkSmall = 'https://firebasestorage.googleapis.com/v0/b/powrsoft.appspot.com/o/company%2FHS_Advantage--Inspection_R7-01.png?alt=media&token=56c7c989-d17b-4969-888d-2f489a256bc3';

  /// space
  static const double textContainerPaddingV = 15;
  static const double textContainerPaddingH = 12;
  static const double textContainerSmallPaddingV = 10;

  static const double widgetPaddingV = 7;
  static const double widgetPaddingH = 10;

  static const double templateSpaceV = 5;

  static const double signSpaceV = 10;

  /// camera zoom
  static const double defaultZoom = 14.4746;

  /// sign pages
  static const pageSplash = 'splash';
  static const pageSignIn = 'sign-in';
  static const pageSignUp = 'sign-up';
  static const pageForgotPassword = 'forgot-password';
  static const pageApproveRequest = 'approve-request';
  static const pageEmailVerify = 'email-verify';
  static const pageHome = 'home-page';

  /// account type label
  static const String labelInspector = 'Inspector';
  static const String labelCompanyAdmin = 'Company Admin';

  /// labels of main survey pages
  static const String pageOrderForm = 'Order Form';
  static const String pageSetup = 'Setup Page';
  static const String pageCover = 'Cover Page';
  static const String pageLetter = 'Letter Page';
  static const String pageInvoice = 'Invoice';
  static const String pageContract = 'Contract';
  static const String pageGeneral = 'General Inspection Information';
  static const String pagePhotoEntry = 'PhotoEntry';
  static const String pageAddendum = 'Addendum';
  static const String pageSummary = 'Summary';

  /// report default
  static const String defaultCoverPhoto = 'https://firebasestorage.googleapis.com/v0/b/powrsoft.appspot.com/o/default%2Fcover_photo.jpg?alt=media&token=ea05bf18-1a3c-4848-b872-1055619f9b63';
  static const List<String> defaultBackColors = ['4B9567', '4B9567', '000000'];

  /// firebase connection checking in realtime database
  static const String connectionStatusRealTime = '.info/connected';

  /// http url
  static const urlHttp = 'http';

  /// nxt api url
  static const String nxtApiUrl = 'https://api2.nxtinspekt.com/api/pull/v1';
  static const String nxtDefaultClientUUID = 'nMQXF9BL';

  /// Java spring server rest api url
  static const String powrsoftApiUrl = 'https://api.powrsoft.com/api';
  //static const String powrsoftApiUrl = 'http://192.168.1.202:8080/api';

  /// Token for using Java Spring RestAPI
  static const String powrsoftToken = 'E9E6648D-FB4F-4382-B2B1-F4AE96F12EE6';

  /// skip email verification, true for test
  static const bool emailVerifySkip = true; // for test

  /// inspection tab type
  static const String tabInspectToday = 'Today';
  static const String tabInspectSearch = 'Search';
  static const String tabInspectFuture = 'Future';
  static const String tabInspectPast = 'Past';

  /// TypeSense
  static const int typeSensePerPage = 10;

  /// asset images
  static const String assetImageSplash = 'assets/images/splash.png';
  static const String assetImageSplash2 = 'assets/images/splash2.png';
  static const String assetImageHomeDefault = 'assets/images/home_default.png';
  static const String assetImageMark = 'assets/images/mark.png';
  static const String assetImageMan = 'assets/images/man.png';
  static const String assetImageHomeDrawer = 'assets/images/home_drawer.png';

  /// asset jsons
  static const String assetJsonQuest = 'assets/quest.json';
  static const String assetJsonQuestValueGeneralInfo = 'assets/quest_value_njn_ger.json';

  /// title center or left, center if true
  static const bool centerTitle = true;

  /// photo entry items (4 + 4 each page)
  static const int photoEntryCnt = 8;
  static const int questPhotoCnt = 4;

  /// image picking max size
  static const double pickingImageMaxWidth = 2000;

  /// quest value json
  static const String questKeyHeader = 'evl_';
  static const String questKeyExtraFooter = '_ext';

  /// menus
  static const String labelMenuSignOut = 'Logout';
  static const String labelMenuSignOutFromCompany = 'Logout Company Admin';
  static const String labelMenuEditJson = 'Edit json(temp)';
  static const String labelMenuProfile = 'Profile';
  static const String labelMenuCompany = 'Company';
  static const String labelMenuEditSurvey = 'Edit Inspection ValueLists';
  static const String labelMenuApprove = 'Approve';

  static const String labelReportEdit = 'Edit Inspection Report';
  static const String labelReportPreview = 'Preview PDF Report';
  static const String labelReportEmail = 'Send Report';

  static const String signBack = 'Back';

  /// tab names
  static const String tabInspections = 'Inspections';
  static const String tabAdministration = 'Administration';
  static const String tabManageUsers = 'Manage Users';
  static const String tabApproveUsers = 'Approve Users';
  static const String tabManagerCompany = 'Manage Company';
  static const String tabEditCompany = 'Edit Company Profile';
  static const String tabTemplateValues = 'Edit Template Values';
  static const String tabTemplateValuesUI = 'Edit Values via UI';
  static const String tabEditProfile = 'Edit Profile';

  /// template page
  static const String pageEditTemplate = 'pageEditTemplate';
  static const String pageEditDocument = 'pageEditDocument';

  /// msg
  static const String msgSaveChecking = 'Do you want to save your changes, or exit without saving which will discard your changes?';
  static const String msgSave = 'Save';
  static const String msgExistDiscardChange = 'Exit and discard changes';

  /// report template files
  static const String reportTemplateFileMain = 'report_template.docx';
  static const String reportTemplateFileAddendum = 'report_template_addendum.docx';
  static const String reportTemplateFileGroup = 'report_template_group.docx';

  /// visible edit json
  static const bool visibleEditJson = false;
}


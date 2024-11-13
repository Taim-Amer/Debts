import 'package:get/get.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class TAppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'next': TEnglishTexts.next,
      'add': TEnglishTexts.add,
      'addAnotherPhone': TEnglishTexts.addAnotherPhone,
      'tcontinue': TEnglishTexts.tcontinue,
      'errorMessage': TEnglishTexts.errorMessage,
      'welcome': TEnglishTexts.welcome,
      'phoneInput': TEnglishTexts.phoneInput,
      'phone': TEnglishTexts.phone,
      'registerTitle': TEnglishTexts.registerTitle,
      'registerSubTitle': TEnglishTexts.registerSubTitle,
      'resendCode': TEnglishTexts.resendCode,
      'resendCodeQuestion': TEnglishTexts.resendCodeQuastion,
      'verificationCode': TEnglishTexts.verificationCode,
      'emptyDebts': TEnglishTexts.emptyDebts,
      'addDebts': TEnglishTexts.addDebts,
      'otpTitle': TEnglishTexts.otpTitle,
      'username': TEnglishTexts.username,
      'email': TEnglishTexts.email,
      'clientName': TEnglishTexts.clientName,
      'clientAddress': TEnglishTexts.clientAddress,
      'clientPhone': TEnglishTexts.clientPhone,
      'pageNumber': TEnglishTexts.pageNumber,
      'records': TEnglishTexts.records,
      'addSponsor': TEnglishTexts.addSponsor,
      'sponsorPhone': TEnglishTexts.sponsorPhone,
      'sponsorAddress': TEnglishTexts.sponsorAddress,
      'amount': TEnglishTexts.amount,
      'productDescription': TEnglishTexts.productDescription,
      'initialPayment': TEnglishTexts.initialPayment,
      'monthlyPayment': TEnglishTexts.monthlyPayment,
      'addNewItem': TEnglishTexts.addNewItem,
      'totalPayment': TEnglishTexts.totalPayment,
      'clients': TEnglishTexts.clients,
      'totalDebts': TEnglishTexts.totalDebts,
      'notations': TEnglishTexts.notations,
      'nonPayers': TEnglishTexts.nonPayers,
      'country': TEnglishTexts.country,
      'filter': TEnglishTexts.filter,
      'searchByName': TEnglishTexts.searchByName,
      'day': TEnglishTexts.day,
      'debt': TEnglishTexts.debt,
      'settled': TEnglishTexts.settled,
      'totalReceived': TEnglishTexts.totalReceived,
      'totalDebtors': TEnglishTexts.totalDebtors,
      'all': TEnglishTexts.all,
      'clientInformation': TEnglishTexts.clientInformation,
      'bySponsor': TEnglishTexts.bySponsor,
      'clientStatus': TEnglishTexts.clientStatus,
      'collectionDate': TEnglishTexts.collectionDate,
      'payment': TEnglishTexts.payment,
      'buying': TEnglishTexts.buying,
      'transactions': TEnglishTexts.transactions,
      'reminderBy': TEnglishTexts.reminderBy,
      'undefined': TEnglishTexts.undefined,
      'weakReminder': TEnglishTexts.weakReminder,
      'monthReminder': TEnglishTexts.monthReminder,
      'customizeReminder': TEnglishTexts.customizeReminder,
      'notationAdd': TEnglishTexts.notationAdd,
      'sponsorName': TEnglishTexts.sponsorName,
      'addNewCollection': TEnglishTexts.addNewCollection,
      'productsName': TEnglishTexts.productsName,
      'productsDescription': TEnglishTexts.productsDescription,
      'notifications': TEnglishTexts.notifications,
      'settings': TEnglishTexts.settings,
      'languageChange': TEnglishTexts.languageChange,
      'arabic': TEnglishTexts.arabic,
      'english': TEnglishTexts.english,
      'privacyPolicy': TEnglishTexts.privacyPolicy,
      'about': TEnglishTexts.about,
      'out': TEnglishTexts.out,
      'accountInfo': TEnglishTexts.accountInfo,
      'otpEnter' : TEnglishTexts.otpEnter,
      'goodsDescription' : TEnglishTexts.goodsDescription,
      'goodsDescription2' : TEnglishTexts.goodsDescription2,
    },
    'ar': {
      'next': TArabicTexts.next,
      'add': TArabicTexts.add,
      'addAnotherPhone': TArabicTexts.addAnotherPhone,
      'tcontinue': TArabicTexts.tcontinue,
      'errorMessage': TArabicTexts.errorMessage,
      'welcome': TArabicTexts.welcome,
      'phoneInput': TArabicTexts.phoneInput,
      'phone': TArabicTexts.phone,
      'registerTitle': TArabicTexts.registerTitle,
      'registerSubTitle': TArabicTexts.registerSubTitle,
      'resendCode': TArabicTexts.resendCode,
      'resendCodeQuestion': TArabicTexts.resendCodeQuastion,
      'verificationCode': TArabicTexts.verificationCode,
      'emptyDebts': TArabicTexts.emptyDebts,
      'addDebts': TArabicTexts.addDebts,
      'otpTitle': TArabicTexts.otpTitle,
      'username': TArabicTexts.username,
      'email': TArabicTexts.email,
      'clientName': TArabicTexts.clientName,
      'clientAddress': TArabicTexts.clientAddress,
      'clientPhone': TArabicTexts.clientPhone,
      'pageNumber': TArabicTexts.pageNumber,
      'records': TArabicTexts.records,
      'addSponsor': TArabicTexts.addSponsor,
      'sponsorPhone': TArabicTexts.sponsorPhone,
      'sponsorAddress': TArabicTexts.sponsorAddress,
      'amount': TArabicTexts.amount,
      'productDescription': TArabicTexts.productDescription,
      'initialPayment': TArabicTexts.initialPayment,
      'monthlyPayment': TArabicTexts.monthlyPayment,
      'addNewItem': TArabicTexts.addNewItem,
      'totalPayment': TArabicTexts.totalPayment,
      'clients': TArabicTexts.clients,
      'totalDebts': TArabicTexts.totalDebts,
      'notations': TArabicTexts.notations,
      'nonPayers': TArabicTexts.nonPayers,
      'country': TArabicTexts.country,
      'filter': TArabicTexts.filter,
      'searchByName': TArabicTexts.searchByName,
      'day': TArabicTexts.day,
      'debt': TArabicTexts.debt,
      'settled': TArabicTexts.settled,
      'totalReceived': TArabicTexts.totalReceived,
      'totalDebtors': TArabicTexts.totalDebtors,
      'all': TArabicTexts.all,
      'clientInformation': TArabicTexts.clientInformation,
      'bySponsor': TArabicTexts.bySponsor,
      'clientStatus': TArabicTexts.clientStatus,
      'collectionDate': TArabicTexts.collectionDate,
      'payment': TArabicTexts.payment,
      'buying': TArabicTexts.buying,
      'transactions': TArabicTexts.transactions,
      'reminderBy': TArabicTexts.reminderBy,
      'undefined': TArabicTexts.undefined,
      'weakReminder': TArabicTexts.weakReminder,
      'monthReminder': TArabicTexts.monthReminder,
      'customizeReminder': TArabicTexts.customizeReminder,
      'notationAdd': TArabicTexts.notationAdd,
      'sponsorName': TArabicTexts.sponsorName,
      'addNewCollection': TArabicTexts.addNewCollection,
      'productsName': TArabicTexts.productsName,
      'productsDescription': TArabicTexts.productsDescription,
      'notifications': TArabicTexts.notifications,
      'settings': TArabicTexts.settings,
      'languageChange': TArabicTexts.languageChange,
      'arabic': TArabicTexts.arabic,
      'english': TArabicTexts.english,
      'privacyPolicy': TArabicTexts.privacyPolicy,
      'about': TArabicTexts.about,
      'out': TArabicTexts.out,
      'accountInfo': TArabicTexts.accountInfo,
      'otpEnter' : TArabicTexts.otpEnter,
      'goodsDescription' : TArabicTexts.goodsDescription,
      'goodsDescription2' : TArabicTexts.goodsDescription2,
    },
  };

  static String kNext = "next".tr;
  static String kAdd = "add".tr;
  static String kAddAnotherPhone = "addAnotherPhone".tr;
  static String kTcontinue = "tcontinue".tr;
  static String kErrorMessage = "errorMessage".tr;
  static String kWelcome = "welcome".tr;
  static String kPhoneInput = "phoneInput".tr;
  static String kPhone = "phone".tr;
  static String kRegisterTitle = "registerTitle".tr;
  static String kRegisterSubTitle = "registerSubTitle".tr;
  static String kResendCode = "resendCode".tr;
  static String kResendCodeQuestion = "resendCodeQuestion".tr;
  static String kVerificationCode = "verificationCode".tr;
  static String kEmptyDebts = "emptyDebts".tr;
  static String kAddDebts = "addDebts".tr;
  static String kOtpTitle = "otpTitle".tr;
  static String kUsername = "username".tr;
  static String kEmail = "email".tr;
  static String kClientName = "clientName".tr;
  static String kClientAddress = "clientAddress".tr;
  static String kClientPhone = "clientPhone".tr;
  static String kPageNumber = "pageNumber".tr;
  static String kRecords = "records".tr;
  static String kAddSponsor = "addSponsor".tr;
  static String kSponsorPhone = "sponsorPhone".tr;
  static String kSponsorAddress = "sponsorAddress".tr;
  static String kAmount = "amount".tr;
  static String kProductDescription = "productDescription".tr;
  static String kInitialPayment = "initialPayment".tr;
  static String kMonthlyPayment = "monthlyPayment".tr;
  static String kAddNewItem = "addNewItem".tr;
  static String kTotalPayment = "totalPayment".tr;
  static String kClients = "clients".tr;
  static String kTotalDebts = "totalDebts".tr;
  static String kNotations = "notations".tr;
  static String kNonPayers = "nonPayers".tr;
  static String kCountry = "country".tr;
  static String kFilter = "filter".tr;
  static String kSearchByName = "searchByName".tr;
  static String kDay = "day".tr;
  static String kDebt = "debt".tr;
  static String kSettled = "settled".tr;
  static String kTotalReceived = "totalReceived".tr;
  static String kTotalDebtors = "totalDebtors".tr;
  static String kAll = "all".tr;
  static String kClientInformation = "clientInformation".tr;
  static String kBySponsor = "bySponsor".tr;
  static String kClientStatus = "clientStatus".tr;
  static String kCollectionDate = "collectionDate".tr;
  static String kPayment = "payment".tr;
  static String kBuying = "buying".tr;
  static String kTransactions = "transactions".tr;
  static String kReminderBy = "reminderBy".tr;
  static String kUndefined = "undefined".tr;
  static String kWeakReminder = "weakReminder".tr;
  static String kMonthReminder = "monthReminder".tr;
  static String kCustomizeReminder = "customizeReminder".tr;
  static String kNotationAdd = "notationAdd".tr;
  static String kSponsorName = "sponsorName".tr;
  static String kAddNewCollection = "addNewCollection".tr;
  static String kProductsName = "productsName".tr;
  static String kProductsDescription = "productsDescription".tr;
  static String kNotifications = "notifications".tr;
  static String kSettings = "settings".tr;
  static String kLanguageChange = "languageChange".tr;
  static String kArabic = "arabic".tr;
  static String kEnglish = "english".tr;
  static String kPrivacyPolicy = "privacyPolicy".tr;
  static String kAbout = "about".tr;
  static String kOut = "out".tr;
  static String kAccountInfo = "accountInfo".tr;
  static String kOtpEnter = "otpEnter".tr;
  static String kGoodsDescription = "goodsDescription".tr;
  static String kGoodsDescription2 = "goodsDescription2".tr;
}

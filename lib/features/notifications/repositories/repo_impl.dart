import 'package:get/get.dart';
import 'package:taha_debts/features/notifications/repositories/repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/logging/logger.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class NotificationRepositoryImpl implements NotificationRepository{
  static NotificationRepositoryImpl get instance => Get.find();
  
  String? token = TCacheHelper.getData(key: "token");
  // String? fcmToken = TCacheHelper.getData(key: "fcmToken");
  
  @override
  Future<void> sendNotification({required String title, required String body}) async{
    final dioHelper = TDioHelper();
    try{
      dioHelper.post(TApiConstants.sendNotification, token: token, {'title' : title, 'body' : body, 'fcm_token' : "c09ljXyhRguR_rqQEz0sO2:APA91bE2NAa-RRwlh2IxkR1ewSwtyh0646QLhsTv96RgG5vx3Gh86bD0PIIm8TSe9KaKszEmSTQM0NekQ6wKlSf6Pw8XC4KMrtMdKdnFy9Lizpv8oqfTSwA"});
    } catch(error){
      TLoggerHelper.info(error.toString());
    }
  }
}
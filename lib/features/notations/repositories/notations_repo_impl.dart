import 'package:get/get.dart';
import 'package:taha_debts/features/notations/models/notes_model.dart';
import 'package:taha_debts/features/notations/repositories/notations_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class NotationsRepositoryImpl implements NotationsRepository{
  static NotationsRepositoryImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: "token");

  @override
  Future<NotesModel> getNotes() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getNotes, token: token).then((response) => NotesModel.fromJson(response));
  }
}
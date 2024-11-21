import 'package:get/get.dart';
import 'package:taha_debts/features/notations/models/notes_model.dart';
import 'package:taha_debts/features/notations/repositories/notations_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';

class NotationsController extends GetxController{
  static NotationsController get instance => Get.find();

  var getNotesStatus = RequestState.begin.obs;
  var notesModel = NotesModel().obs;

  @override
  void onReady() {
    getNotes();
    super.onReady();
  }

  void updateStatus({required RequestState value}) {
    getNotesStatus.value = value;
  }

  Future<void> getNotes() async{
    updateStatus(value: RequestState.loading);
    try{
      notesModel.value = await NotationsRepositoryImpl.instance.getNotes();
      if(notesModel.value.status == true){
        updateStatus(value: RequestState.success);
      }
    } catch(error){
      updateStatus(value: RequestState.onError);
    }
  }
}
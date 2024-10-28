

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initServiceLocator(){
  //
  // getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  //
  // getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  //
  // getIt.registerSingleton<GoogleSignIn>(GoogleSignIn());
  //
  // getIt.registerSingleton<TCacheHelper>(TCacheHelper());
  //
  // getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(firebaseAuth: getIt.get<FirebaseAuth>()));
  //
  // getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(firebaseFireStore: getIt.get<FirebaseFirestore>() ,firebaseAuth: getIt.get<FirebaseAuth>()));
  //
  // getIt.registerSingleton<GoogleAuthRepoImpl>(GoogleAuthRepoImpl(googleSignIn: getIt.get<GoogleSignIn>(), firebaseFirestore: getIt.get<FirebaseFirestore>(), firebaseAuth: getIt.get<FirebaseAuth>()));
  //
  // getIt.registerSingleton<FeedsRepoImpl>(FeedsRepoImpl(firebaseFirestore: getIt.get<FirebaseFirestore>()));
}
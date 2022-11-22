import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../../data/data_provider/remote/dio_helper.dart';
import '../../../presentation/screens/homepage.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = false;
  bool visibleConfirmPassword = false;

  /// function to change password visibility
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  /// function to change password visibility
  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    emit(VisibleConfirmPasswordState());
  }

  String gender = 'm';
  void changeGender(value){
    gender = value;
    emit(ChangeGenderState());
  }
  String uni = 'AUC';
  void changeuni(value){
    uni = value;
    emit(ChangeUniState());
  }
  String grade = 'One';
  void changegrade(value){
   grade = value;
    emit(ChangeGradeState());
  }

  Future postRegister(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required String gender,
        required String universityId,
        required String gradeId,
      context}) async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "universityId": universityId,
      "gradeId":gradeId,
    }).then((value) {
      if (value.statusCode == 200) {

        flutterToast(msg: 'Registered Successfully', color: Colors.green);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const home(),
            ),
            (route) => false);
        emit(RegisterSuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(RegisterErrorState());
    });
  }
}

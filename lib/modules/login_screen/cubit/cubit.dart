import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingapp/model/user_model.dart';
import 'package:shopingapp/modules/login_screen/cubit/states.dart';
import 'package:shopingapp/network/remote/dio_helper.dart';
import 'package:shopingapp/shared/components/end_point.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordShown = true;
  IconData sufIcon = Icons.visibility_outlined;
  UserModel _userLogin;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    sufIcon = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(PasswordChangeVisibility());
  }

  void userLogin(String email, String password) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      _userLogin = UserModel.fromJson(value.data);
      emit(ShopLoginSuccessState(_userLogin));

    }).catchError((onError) {
      emit(ShopLoginErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}

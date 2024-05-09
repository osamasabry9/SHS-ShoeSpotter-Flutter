import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/sign_up_request.dart';
import '../../domain/usecases/sign_in_user_usecase.dart';
import '../../domain/usecases/sign_up_user_usecase.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignInUserUseCase signInUserUseCase;
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signInUserUseCase, this.signUpUseCase)
      : super(
          SignUpInitial(),
        );

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(SignUpLoading());

    try {
      await signUpUseCase.call(SignUpRequest(
        username: userNameController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
      ));
      emit(SignUpSuccess());
    } on SocketException catch (_) {
      emit(SignUpFailure());
    } catch (_) {
      emit(SignUpFailure());
    }
  }
}

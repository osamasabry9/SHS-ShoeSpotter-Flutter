// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'sign_up_state.freezed.dart';

// @freezed
// class SignUpState<T> with _$SignUpState<T> {
//   const factory SignUpState.initial() = _Initial;

//   const factory SignUpState.loading() = Loading;
//   const factory SignUpState.success(T data) = Success<T>;
//   const factory SignUpState.error({required String error}) = Error;
// }


import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpLoading extends SignUpState {
  @override
  List<Object> get props => [];
}


class SignUpSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}


class SignUpFailure extends SignUpState {
  @override
  List<Object> get props => [];
}

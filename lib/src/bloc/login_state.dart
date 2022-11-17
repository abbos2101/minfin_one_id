part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState.state({
    @Default("") String initialUrl,
    @Default("") String currentUrl,
    @Default(0) int progress,
    dynamic user,
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success, next }
